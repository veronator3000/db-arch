using Npgsql;

// ┐(シ)┌ ┐(シ)┌ ┐(シ)┌
var filePath = "/docker-entrypoint-initdb.d/result/query_results.txt";
var connectionString = "Host=db;Username=user;Password=password;Database=twich;Port=5432;";
Console.WriteLine("ANALYXE SERVICE STARTED");

var attemptCount = int.Parse(Environment.GetEnvironmentVariable("ATTEMPT_COUNT") ?? "3");

string[] queries =
{
    "SELECT * FROM users",
};

using (var writer = new StreamWriter(filePath))
{
    foreach (var query in queries)
    {
        ExecuteExplainAnalyze(query, connectionString, writer, attemptCount);
    }
}

Console.WriteLine($"RESULTS SAVED: {filePath}");
return;


static void ExecuteExplainAnalyze(string query, string connectionString, StreamWriter writer, int attemptCount)
{
// я пока что вообще не понимаю
    using var connection = new NpgsqlConnection(connectionString);
    connection.Open();

    for (int i = 1; i <= attemptCount; i++)
    {
        using (var command = new NpgsqlCommand($"EXPLAIN ANALYZE {query}", connection))
        using (var reader = command.ExecuteReader())
        {
            writer.WriteLine("results for query: {query}, Attempt: {i}");
            writer.WriteLine("┐(シ)┌ ┐(シ)┌ ┐(シ)┌");

            while (reader.Read())
            {
                writer.WriteLine(reader.GetString(0));
            }

            writer.WriteLine();
        }
    }
}