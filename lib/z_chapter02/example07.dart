//Using constants to display weather information
void main() {
  const SUNNY = 'Sunny';
  const CLOUDY = 'Cloudy';
  const RAINY = 'Rainy';

  //#1. Switch doesn't complain for const, but raise error for enums
  var choice = SUNNY;
  switch (choice) {
    case SUNNY:
      print("Sunny weather today");
      break;
  }
}
