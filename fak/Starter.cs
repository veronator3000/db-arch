using Bogus;
using Npgsql;
using System;

var fillingCnt = int.Parse(Environment.GetEnvironmentVariable("FILLING_CNT") ?? "10");

var faker = new Faker();

Console.WriteLine("this fiilcnt" + fillingCnt);

const string connectionString = "Host=db;Username=user;Password=password;Database=twich;Port=5432;";

using var connection = new NpgsqlConnection(connectionString);
connection.Open();
var checkRolesCmd = new NpgsqlCommand("SELECT COUNT(*) FROM roles", connection);
var existingRolesCount = (long)checkRolesCmd.ExecuteScalar();
Console.WriteLine("exRC = " + existingRolesCount);
if (existingRolesCount > 0)
{
    Console.WriteLine("this fc = " + fillingCnt);
    fillingCnt = 0;
}

// для корректного создания
using var cmdRoles = new NpgsqlCommand();
using var cmdUsers = new NpgsqlCommand();
using var cmdRolesFunctionalities = new NpgsqlCommand();
using var cmdStreams = new NpgsqlCommand();
using var cmdChatMessages = new NpgsqlCommand();
using var cmdSubscribers = new NpgsqlCommand();
using var cmdSubscribedUsers = new NpgsqlCommand();
using var cmdNotifications = new NpgsqlCommand();
using var cmdRecommendations = new NpgsqlCommand();
var cmdTransactionsMoney = new NpgsqlCommand();

var check = new NpgsqlCommand("SELECT EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'recommendations')", connection);
var existFlag = (bool)check.ExecuteScalar();



cmdRoles.Connection = connection;
cmdUsers.Connection = connection;
cmdRolesFunctionalities.Connection = connection;
cmdStreams.Connection = connection;
cmdChatMessages.Connection = connection;
cmdSubscribers.Connection = connection;
cmdSubscribedUsers.Connection = connection;
cmdNotifications.Connection = connection;
cmdRecommendations.Connection = connection;
cmdTransactionsMoney.Connection = connection;

// если не отработал полностью 1.х.х - все отношения не созданы, то не заполняем таблицу
if (existFlag)
{
    for (var i = 0; i < fillingCnt; i++)
    {
        var roleName = faker.Random.Word();
        var weight = faker.Random.Number(1, 100);

        cmdRoles.CommandText = "INSERT INTO roles (role_name, weight) VALUES (@roleName, @weight)";
        cmdRoles.Parameters.Clear(); 

        var roleNameParam = new NpgsqlParameter("@roleName", roleName);
        var weightParam = new NpgsqlParameter("@weight", weight);
        cmdRoles.Parameters.Add(roleNameParam);
        cmdRoles.Parameters.Add(weightParam);

        cmdRoles.ExecuteNonQuery();
    }



// users
    for (var i = 0; i < fillingCnt; i++)
    {
        var username = faker.Internet.UserName();
        var roleId = faker.Random.Number(1, fillingCnt);
        var createdAt = faker.Date.Recent();

        cmdUsers.CommandText =
            "INSERT INTO users (username, role_id, created_at) VALUES (@username, @roleId, @createdAt)";
        cmdUsers.Parameters.Clear(); 

        var usernameParam = new NpgsqlParameter("@username", username);
        var roleIdParam = new NpgsqlParameter("@roleId", roleId);
        var createdAtParam = new NpgsqlParameter("@createdAt", createdAt);

        cmdUsers.Parameters.Add(usernameParam);
        cmdUsers.Parameters.Add(roleIdParam);
        cmdUsers.Parameters.Add(createdAtParam);

        cmdUsers.ExecuteNonQuery();
    }


// roles_functionalities
    for (var i = 0; i < fillingCnt; i++)
    {
        var roleId = faker.Random.Number(1, fillingCnt);
        var functionalityId = faker.Random.Number(1, 1000);
        var minWeightRequired = faker.Random.Number(1, 100);

        cmdRolesFunctionalities.CommandText =
            "INSERT INTO roles_functionalities (role_id, functionality_id, min_weight_required) VALUES (@roleId, @functionalityId, @minWeightRequired)";
        cmdRolesFunctionalities.Parameters.Clear(); 

        var roleIdParam = new NpgsqlParameter("@roleId", roleId);
        var functionalityIdParam = new NpgsqlParameter("@functionalityId", functionalityId);
        var minWeightRequiredParam = new NpgsqlParameter("@minWeightRequired", minWeightRequired);

        cmdRolesFunctionalities.Parameters.Add(roleIdParam);
        cmdRolesFunctionalities.Parameters.Add(functionalityIdParam);
        cmdRolesFunctionalities.Parameters.Add(minWeightRequiredParam);

        cmdRolesFunctionalities.ExecuteNonQuery();
    }


// streams
    for (var i = 0; i < fillingCnt; i++)
    {
        var title = faker.Lorem.Sentence();
        var description = faker.Lorem.Paragraph();
        var category = faker.Random.Word();
        var duration = TimeSpan.FromMinutes(faker.Random.Number(1, 240));
        var viewersCount = faker.Random.Number(0, 10000);
        var userId = faker.Random.Number(1, fillingCnt);

        cmdStreams.CommandText =
            "INSERT INTO streams (title, description, category, duration, viewers_count, user_id) VALUES (@title, @description, @category, @duration, @viewersCount, @userId)";
        cmdStreams.Parameters.Clear();

        var titleParam = new NpgsqlParameter("@title", title);
        var descriptionParam = new NpgsqlParameter("@description", description);
        var categoryParam = new NpgsqlParameter("@category", category);
        var durationParam = new NpgsqlParameter("@duration", duration);
        var viewersCountParam = new NpgsqlParameter("@viewersCount", viewersCount);
        var userIdParam = new NpgsqlParameter("@userId", userId);

        cmdStreams.Parameters.Add(titleParam);
        cmdStreams.Parameters.Add(descriptionParam);
        cmdStreams.Parameters.Add(categoryParam);
        cmdStreams.Parameters.Add(durationParam);
        cmdStreams.Parameters.Add(viewersCountParam);
        cmdStreams.Parameters.Add(userIdParam);

        cmdStreams.ExecuteNonQuery();
    }

    // chat_messages
    for (var i = 0; i < fillingCnt; i++)
    {
        var message = faker.Lorem.Sentence();
        var userId = faker.Random.Number(1, fillingCnt);
        var streamId = faker.Random.Number(1, fillingCnt);

        cmdChatMessages.CommandText =
            "INSERT INTO chat_messages (message, user_id, stream_id) VALUES (@message, @userId, @streamId)";
        cmdChatMessages.Parameters.Clear(); 

        var messageParam = new NpgsqlParameter("@message", message);
        var userIdParam = new NpgsqlParameter("@userId", userId);
        var streamIdParam = new NpgsqlParameter("@streamId", streamId);

        cmdChatMessages.Parameters.Add(messageParam);
        cmdChatMessages.Parameters.Add(userIdParam);
        cmdChatMessages.Parameters.Add(streamIdParam);

        cmdChatMessages.ExecuteNonQuery();
    }


// subscribers
    for (var i = 0; i < fillingCnt; i++)
    {
        var subscriberUserId = faker.Random.Number(1, fillingCnt);

        cmdSubscribers.CommandText = "INSERT INTO subscribers (subscriber_user_id) VALUES (@subscriberUserId)";
        cmdSubscribers.Parameters.Clear(); 

        var subscriberUserIdParam = new NpgsqlParameter("@subscriberUserId", subscriberUserId);
        cmdSubscribers.Parameters.Add(subscriberUserIdParam);

        cmdSubscribers.ExecuteNonQuery();
    }

// subscribed_users
    for (var i = 0; i < fillingCnt; i++)
    {
        var subscribedUserId = faker.Random.Number(1, fillingCnt);

        cmdSubscribedUsers.CommandText = "INSERT INTO subscribed_users (subscribed_user_id) VALUES (@subscribedUserId)";
        cmdSubscribedUsers.Parameters.Clear(); 

        var subscribedUserIdParam = new NpgsqlParameter("@subscribedUserId", subscribedUserId);
        cmdSubscribedUsers.Parameters.Add(subscribedUserIdParam);

        cmdSubscribedUsers.ExecuteNonQuery();
    }

// notifications
    for (var i = 0; i < fillingCnt; i++)
    {
        var userId = faker.Random.Number(1, fillingCnt);
        var type = faker.Random.Word();
        var message = faker.Lorem.Sentence();

        cmdNotifications.CommandText =
            "INSERT INTO notifications (user_id, type, message) VALUES (@userId, @type, @message)";
        cmdNotifications.Parameters.Clear(); 

        var userIdParam = new NpgsqlParameter("@userId", userId);
        var typeParam = new NpgsqlParameter("@type", type);
        var messageParam = new NpgsqlParameter("@message", message);

        cmdNotifications.Parameters.Add(userIdParam);
        cmdNotifications.Parameters.Add(typeParam);
        cmdNotifications.Parameters.Add(messageParam);

        cmdNotifications.ExecuteNonQuery();
    }


// recommendations
    for (var i = 0; i < fillingCnt; i++)
    {
        var userId = faker.Random.Number(1, fillingCnt);
        var recommendedStreamId = faker.Random.Number(1, fillingCnt);
        var recommendedCategory = faker.Random.Word();

        cmdRecommendations.CommandText =
            "INSERT INTO recommendations (user_id, recommended_stream_id, recommended_category) VALUES (@userId, @recommendedStreamId, @recommendedCategory)";
        cmdRecommendations.Parameters.Clear();

        var userIdParam = new NpgsqlParameter("@userId", userId);
        var recommendedStreamIdParam = new NpgsqlParameter("@recommendedStreamId", recommendedStreamId);
        var recommendedCategoryParam = new NpgsqlParameter("@recommendedCategory", recommendedCategory);

        cmdRecommendations.Parameters.Add(userIdParam);
        cmdRecommendations.Parameters.Add(recommendedStreamIdParam);
        cmdRecommendations.Parameters.Add(recommendedCategoryParam);

        cmdRecommendations.ExecuteNonQuery();
    }
    
    // transactions_money 
    for (var i = 0; i < fillingCnt; i++)
    {
        var amount = faker.Random.Decimal(1, 1000);
        var senderUserId = faker.Random.Number(1, fillingCnt);
        var receiverUserId = faker.Random.Number(1, fillingCnt);
        var transactionType = faker.Finance.TransactionType();
        var status = faker.Random.ArrayElement(new[] { "pending", "completed", "failed" });
        var streamId = faker.Random.Number(1, fillingCnt);
        var createdAt = faker.Date.Recent();

        cmdTransactionsMoney.CommandText = @"INSERT INTO transactions_money 
                                        (amount, sender_user_id, receiver_user_id, transaction_type, status, stream_id, created_at) 
                                        VALUES 
                                        (@amount, @senderUserId, @receiverUserId, @transactionType, @status, @streamId, @createdAt)";
        cmdTransactionsMoney.Parameters.Clear(); 

        var amountParam = new NpgsqlParameter("@amount", amount);
        var senderUserIdParam = new NpgsqlParameter("@senderUserId", senderUserId);
        var receiverUserIdParam = new NpgsqlParameter("@receiverUserId", receiverUserId);
        var transactionTypeParam = new NpgsqlParameter("@transactionType", transactionType);
        var statusParam = new NpgsqlParameter("@status", status);
        var streamIdParam = new NpgsqlParameter("@streamId", streamId);
        var createdAtParam = new NpgsqlParameter("@createdAt", createdAt);

        cmdTransactionsMoney.Parameters.Add(amountParam);
        cmdTransactionsMoney.Parameters.Add(senderUserIdParam);
        cmdTransactionsMoney.Parameters.Add(receiverUserIdParam);
        cmdTransactionsMoney.Parameters.Add(transactionTypeParam);
        cmdTransactionsMoney.Parameters.Add(statusParam);
        cmdTransactionsMoney.Parameters.Add(streamIdParam);
        cmdTransactionsMoney.Parameters.Add(createdAtParam);

        cmdTransactionsMoney.ExecuteNonQuery();
    }
}

Console.WriteLine("HIIIIIIIIIIIII");
