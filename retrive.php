<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Weather Data Display</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h1>Weather Data</h1>
    <?php
    // Database credentials
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "weather_API";

    // Create a connection
    $conn = new mysqli($servername, $username, $password, $dbname);

    // Check the connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Retrieve distinct dates
    $dateQuery = "SELECT DISTINCT DATE(date) AS distinct_date FROM weather_data";
    $dateResult = $conn->query($dateQuery);

    if ($dateResult->num_rows > 0) {
        while ($dateRow = $dateResult->fetch_assoc()) {
            $distinctDate = $dateRow["distinct_date"];

            // Retrieve weather data for the distinct date
            $sql = "SELECT city, country, date, weatherCondition, temperature, pressure, windSpeed, humidity
                    FROM weather_data
                    WHERE DATE(date) = '$distinctDate'
                    ORDER BY date DESC
                    LIMIT 1";

            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
                echo "<table>";
                echo "<tr><th>City</th><th>Country</th><th>Date</th><th>Weather Condition</th><th>Temperature</th><th>Pressure</th><th>Wind Speed</th><th>Humidity</th></tr>";

                while ($row = $result->fetch_assoc()) {
                    echo "<tr>";
                    echo "<td>" . $row["city"] . "</td>";
                    echo "<td>" . $row["country"] . "</td>";
                    echo "<td>" . $row["date"] . "</td>";
                    echo "<td>" . $row["weatherCondition"] . "</td>";
                    echo "<td>" . $row["temperature"] . "</td>";
                    echo "<td>" . $row["pressure"] . "</td>";
                    echo "<td>" . $row["windSpeed"] . "</td>";
                    echo "<td>" . $row["humidity"] . "</td>";
                    echo "</tr>";
                }

                echo "</table>";
            } else {
                echo "No weather data found for $distinctDate";
            }
        }
    } else {
        echo "No distinct dates found.";
    }

    // Close the connection
    $conn->close();
    ?>
</body>
</html>