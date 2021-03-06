import 'package:weather_app/utilities/constants.dart';
import 'package:weather_app/services/location.dart';
import 'networking.dart';

class WeatherModel {
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }

  Future<dynamic> getLocationData() async {
    Location location = new Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = new NetworkHelper(
        '$kOpenWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$kApiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$kOpenWeatherMapURL?q=$cityName&appid=$kApiKey&units=metric';
    NetworkHelper networkHelper = new NetworkHelper(url);

    var weatherData = await networkHelper.getData();
    return weatherData;
  }
}
