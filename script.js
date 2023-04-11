const searchButtonElement = document.querySelector(".search-button");
const inputElement = document.querySelector(".search-input");

async function checkWeather(city = "Birendranagar") {
  const apiKey = "6b494793d5ccead379d5fcd01b286667";
  const apiUrl = `https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=${apiKey}&units=metric`;

  try {
    const response = await fetch(apiUrl);
    const data = await response.json();
    console.log(data);

    const currentDate = new Date();
    const day = getDayString(currentDate.getDay());
    const date = currentDate.getDate();
    const month = getMonthString(currentDate.getMonth());

    document.querySelector(".city").textContent = data.name;
    document.querySelector(".date").textContent = `${day}, ${date} ${month}`;
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
    "09": "icons/rain.png",
    "10": "icons/rain.png",
    "11": "icons/thunderstorm.png",
    "13": "icons/snowy.png",
    "50": "icons/mist.png",
  };

  const weatherIconCode = iconCode.substr(0, 2);
  const weatherIconUrl = iconMap[weatherIconCode] || "icons/default.png";
  return weatherIconUrl;
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
