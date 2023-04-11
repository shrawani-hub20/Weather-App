<?php
/*// Connect to the database
$servername = "localhost";
$username = "root";
$password = " ";
$dbname = "weather_API";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get the city parameter from the request
$city = $_GET["city"] ?? "Birendranagar";

// Check if weather data is cached
$sql = "SELECT * FROM weather_cache WHERE city ='$city'";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ss", $city);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    // Data is cached, retrieve and send
    $row = $result->fetch_assoc();
    echo $row["weather_data"];
} else {
    // Data is not cached, fetch from OpenWeatherMap API
    $apiKey = "6b494793d5ccead379d5fcd01b286667";
    $apiUrl = "https://api.openweathermap.org/data/2.5/weather?q={$city}&appid={$apiKey}&units=metric";

    $response = file_get_contents($apiUrl);
    $data = json_decode($response, true);

    // Cache the data in the database
    $insertSql = "INSERT INTO weather_cache (Dates, City, Temperature, Conditions, Humidity, Visibility, Pressure, Speed) VALUES ('$date', '$city','$temperature', '$conditions' , '$humidity' , '$visibility' , '$pressure' , '$speed')";
    $insertStmt = $conn->prepare($insertSql);
    $insertStmt->bind_param("ss", $city, $city, $country, $date, $weatherCondition, $weatherIcon, $temperature, $pressure, $windSpeed, $humidity);
    $insertStmt->execute();

    // Send the fetched data as JSON
    echo $response;
}

// Close the database connection
$stmt->close();
$conn->close();*/


header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");

// Enable detailed error reporting for MySQLi
mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    try {
        // Get the raw JSON data from the request body
        $json = file_get_contents('php://input');

        // Decode the JSON data
        $weatherData = json_decode($json, true);

        if ($weatherData !== null) {
            // Database credentials
            $servername = "localhost";
            $username = "root";
            $password = "";
            $dbname = "weather_api";

            // Create a connection and select the database
            $conn = new mysqli($servername, $username, $password, $dbname);

            // Check the connection
            if ($conn->connect_error) {
                die("Connection failed: " . $conn->connect_error);
            }

            // Extract the relevant data from the decoded JSON
            $city = isset($weatherData["city"]) ? $weatherData["city"] : "";
            $country = isset($weatherData["country"]) ? $weatherData["country"] : "";
            $date = isset($weatherData["date"]) ? $weatherData["date"] : "";
            $weatherCondition = isset($weatherData["weatherCondition"]) ? $weatherData["weatherCondition"] : "";
            $weatherIcon = isset($weatherData["weatherIcon"]) ? $weatherData["weatherIcon"] : "";
            $temperature = isset($weatherData["temperature"]) ? $weatherData["temperature"] : "";
            $pressure = isset($weatherData["pressure"]) ? $weatherData["pressure"] : "";
            $windSpeed = isset($weatherData["windSpeed"]) ? $weatherData["windSpeed"] : "";
            $humidity = isset($weatherData["humidity"]) ? $weatherData["humidity"] : "";

            // Prepare the SQL query
            $insertSQL = "INSERT INTO weather_data (city, country, date, weatherCondition, weatherIcon, temperature, pressure, windSpeed, humidity) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

            // Prepare and bind the statement
            $stmt = $conn->prepare($insertSQL);
            if (!$stmt) {
                throw new Exception("Prepare failed: " . $conn->error);
            }

            // Bind parameters
            $stmt->bind_param("sssssssss", $city, $country, $date, $weatherCondition, $weatherIcon, $temperature, $pressure, $windSpeed, $humidity);

            // Execute the query
            if ($stmt->execute() === TRUE) {
                echo "Weather data inserted successfully";
            } else {
                throw new Exception("Error inserting weather data: " . $stmt->error);
            }

            // Close the statement
            $stmt->close();

            // Close the connection
            $conn->close();
        } else {
            echo "Invalid JSON data received";
        }
    } catch (Exception $e) {
        echo "An error occurred: " . $e->getMessage();
    }
} else {
    echo "Invalid request method";
}
?>
