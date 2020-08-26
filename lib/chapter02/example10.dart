enum Weather {
  sunny,
  cloudy,
  rainy,
}

extension WeatherExt on Weather {
  //custom message for each weather type
  static const weatherMap = {
    Weather.sunny: "What a lovely weather",
    Weather.cloudy: "Scattered showers predicted",
    Weather.rainy: "Will be raining today",
  };

  //prints enum index and custom message
  void console() {
    print("${this.index} ${this.about}");
  }

  //about property returns the custom message
  String get about => weatherMap[this];
}

void main() {
  //Calling console() on each member
  Weather.values.forEach((w) => w.console());

  //Printing about property for Weather.SUNNY enum
  print(Weather.sunny.about);
}
