const searchButtonElement = document.querySelector(".search-button");
const inputElement = document.querySelector(".search-input");

async function checkWeather(city = "Birendranagar") {
  const apiKey = "6b494793d5ccead379d5fcd01b286667";
  const apiUrl = `https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=${apiKey}&units=metric`;

  try {
    const response = await fetch(apiUrl);
    const data = await response.json();
    console.log(data);
    saveWeather(data);

    const currentDate = convertTimeStamp(data.dt);
    

    document.querySelector(".city").textContent = data.name;
    document.querySelector(".date").textContent = currentDate;
    document.querySelector(".temp").innerHTML = `${data.main.temp}°C`;
    document.querySelector(".condition").textContent = data.weather[0].description;
    document.querySelector(".humidity").textContent = `${data.main.humidity}%`;
    document.querySelector(".wind").textContent = `${data.wind.speed} km/h`;
    document.querySelector(".press").textContent = `${data.main.pressure} hPa`;

    const weatherIconCode = data.weather[0].icon;
    const weatherIconUrl = getWeatherIconUrl(weatherIconCode);
    document.querySelector(".weather-icon").src = weatherIconUrl;
  } catch (error) {
    console.error("Error fetching weather data:", error);
  }
}
function viewData(cityname){
  console.log("VIEWDATA: Running")
  console.log(cityname);
  var form = document.createElement('form');
  form.method = 'POST';
  form.action = 'retrive.php';
  form.target = '_blank';  // to open in a new tab

  var hiddenField = document.createElement('input');
  hiddenField.type = 'hidden';
  hiddenField.name = 'cityval';
  hiddenField.value = cityname;

  form.appendChild(hiddenField);
  document.body.appendChild(form);

  form.submit();

  document.body.removeChild(form);
}

function convertTimeStamp(timestamp) {
  const date = new Date(timestamp * 1000);
  const year = date.getFullYear();
  const month = (date.getMonth() + 1).toString().padStart(2, '0'); 
  const day = date.getDate().toString().padStart(2, '0');
  return `${year}-${month}-${day}`;
}
function getDayString(dayIndex) {
  const days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
  return days[dayIndex];
}

function getMonthString(monthIndex) {
  const months = [
    "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"
  ];
  return months[monthIndex];
}

function getWeatherIconUrl(iconCode) {
  const iconMap = {
    "01": "icons/sunny.png",
    "02": "icons/partly_cloudy.png",
    "03": "icons/cloudy.png",
    "04": "icons/cloudy.png",
    "09": "icons/rainy.png",
    "10": "icons/rainy.png",
    "11": "icons/thunderstorm.png",
    "13": "icons/snowy.png",
    "50": "icons/mist.png",
  };

  const weatherIconCode = iconCode.substr(0, 2);
  const weatherIconUrl = iconMap[weatherIconCode] || "icons/default.png";
  return weatherIconUrl;
}
async function sendWeather (data) {
  try {
    let date = convertTimeStamp(data.dt);

    let weatherData = {
      city: data.name,
      country: data.sys.country,
      date: date,
      weatherCondition: data.weather[0].description,
      weatherIcon: data.weather[0].icon,
      temperature: data.main.temp,
      pressure: data.main.pressure,
      windSpeed: data.wind.speed,
      humidity: data.main.humidity,
    };

    console.log(weatherData);
    const url = "data.php";

    const options = {
      method: "POST",
      body: JSON.stringify(weatherData),
      headers: {
        "Content-Type": "application/json",
      },
    };

    const response = await fetch(url, options);

    if (response.ok) {
      const responseData = await response.text();
      console.log(responseData);
    } else {
      console.log("Error: " + response.status);
    }
  } catch (error) {
    console.log("An error occurred:", error);
  }
}

// Add event listener to the search button
searchButtonElement.addEventListener("click", () => {
  const searchCity = inputElement.value.trim();
  if (searchCity !== "") {
    checkWeather(searchCity);
    inputElement.value = "";
  }
});

inputElement.addEventListener("keypress", (event) => {
  if (event.key === "Enter") {
    const searchCity = inputElement.value.trim();
    if (searchCity !== "") {
      checkWeather(searchCity);
      inputElement.value = "";
    }
  }
});

checkWeather(); // Display weather for "Birendranagar" by default
