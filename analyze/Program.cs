using System;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using Npgsql;
using System.Collections.Generic;

class Program
{
    static void Main(string[] args)
    {
        var timestamp = DateTime.Now.ToString("yyyyMMddHHmmss");
        var filePath = $"/docker-entrypoint-initdb.d/result/query_results_{timestamp}.txt";
        var connectionString = "Host=db;Username=user;Password=password;Database=twich;Port=5432;";
        Console.WriteLine("ANALYZE SERVICE STARTED");

        var attemptCount = int.Parse(Environment.GetEnvironmentVariable("ATTEMPT_COUNT") ?? "4");

        string[] queries =
        {
            "SELECT s.id AS stream_id, s.category, COUNT(sv.viewer_id) AS viewers_count FROM streams s LEFT JOIN stream_viewers sv ON s.id = sv.stream_id WHERE s.category = @category GROUP BY s.id, s.category;",
            "SELECT * FROM chat_messages WHERE stream_id = @stream_id;",
            "SELECT DATE_TRUNC('month', created_at) AS month, COUNT(*) AS transaction_count FROM transactions_money WHERE created_at >= DATE_TRUNC('year', CURRENT_DATE) - INTERVAL '5 years' GROUP BY DATE_TRUNC('month', created_at) ORDER BY DATE_TRUNC('month', created_at);",
            "SELECT DISTINCT s.user_id as streamer_id, u.username as streamer_username, su.subscribing_user_id as find_for_user FROM streams s JOIN subscribed_users su ON s.user_id = su.subscribed_user_id JOIN users u on s.user_id = u.id WHERE su.subscribing_user_id = @subscribing_user_id;"
        };

        var costs = new double[queries.Length][];
        for (var i = 0; i < costs.Length; i++)
        {
            costs[i] = new double[attemptCount];
        }

        try
        {
            using (var writer = new StreamWriter(filePath))
            {
                using (var connection = new NpgsqlConnection(connectionString))
                {
                    connection.Open();

                    var category = GetRandomCategory(connection);
                    var streamId = GetRandomStreamId(connection);
                    var subscribingUserId = GetRandomSubscribingUserId(connection);

                    for (var q = 0; q < queries.Length; q++)
                    {
                        var query = queries[q];
                        Console.WriteLine($"Executing query {q + 1}/{queries.Length}: {query}");
                        for (var a = 0; a < attemptCount; a++)
                        {
                            try
                            {
                                using (var command = new NpgsqlCommand($"EXPLAIN ANALYZE {query}", connection))
                                {
                                    if (query.Contains("@category"))
                                        command.Parameters.AddWithValue("category", category);
                                    if (query.Contains("@stream_id"))
                                        command.Parameters.AddWithValue("stream_id", streamId);
                                    if (query.Contains("@subscribing_user_id"))
                                        command.Parameters.AddWithValue("subscribing_user_id", subscribingUserId);

                                    using (var reader = command.ExecuteReader())
                                    {
                                        var res = new List<double>();

                                        while (reader.Read())
                                        {
                                            var result = reader.GetString(0);
                                            var match = Regex.Match(result, @"cost=(\d+\.\d+)..(\d+\.\d+)");

                                            if (match.Success)
                                            {
                                                var startCost = double.Parse(match.Groups[1].Value);
                                                var endCost = double.Parse(match.Groups[2].Value);
                                                res.Add(endCost);
                                                Console.WriteLine(
                                                    $"attempt {a + 1}/{attemptCount}: startCost={startCost}, endCost={endCost}");
                                            }
                                            else
                                            {
                                                Console.WriteLine("no match found for cost in result: " + result);
                                            }
                                        }

                                        if (a == attemptCount - 1)
                                        {
                                            var minC = res.Min();
                                            var maxC = res.Max();
                                            var avgC = res.Average();
                                            writer.WriteLine($"query: {query}");
                                            writer.WriteLine($"best case time: {minC}");
                                            writer.WriteLine($"worst case time: {maxC}");
                                            writer.WriteLine($"average case time: {avgC}");
                                            writer.WriteLine("┐(シ)┌ ┐(シ)┌ ┐(シ)┌");
                                            writer.WriteLine();

                                        }
                                    }
                                }
                            }
                            catch (Exception ex)
                            {
                                Console.WriteLine($"ERROR: {ex.Message}");
                            }
                        }
                    }
                }
            }

            Console.WriteLine($"RESULTS SAVED: {filePath}");
        }
        catch (Exception ex)
        {
            Console.WriteLine($"error writing to file: {ex.Message}");
        }
    }

    static string GetRandomCategory(NpgsqlConnection connection)
    {
        using (var command = new NpgsqlCommand("SELECT category FROM streams ORDER BY RANDOM() LIMIT 1;", connection))
        {
            return command.ExecuteScalar().ToString();
        }
    }

    static int GetRandomStreamId(NpgsqlConnection connection)
    {
        using (var command = new NpgsqlCommand("SELECT id FROM chat_messages ORDER BY RANDOM() LIMIT 1;", connection))
        {
            return Convert.ToInt32(command.ExecuteScalar());
        }
    }

    static int GetRandomSubscribingUserId(NpgsqlConnection connection)
    {
        using (var command = new NpgsqlCommand("SELECT subscribing_user_id FROM subscribed_users ORDER BY RANDOM() LIMIT 1;", connection))
        {
            return Convert.ToInt32(command.ExecuteScalar());
        }
    }
}
