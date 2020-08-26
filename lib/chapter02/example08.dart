//Using Enums to display weather information
enum Weather {
  sunny,
  cloudy,
  rainy,
}
void main() {
  var weather = Weather.sunny;

  //Following code will complain about if all members are not present
  //Use default-block when all case-blocks are not available
  switch (weather) {
    case Weather.sunny:
      print("Sunny weather today!");
      break;
    case Weather.cloudy:
      print("Cloudy today!");
      break;
    case Weather.rainy:
      print("Rainy and gloomy weather.");
      break;

    default:
      print("Current weather:${weather}");
  }
}
