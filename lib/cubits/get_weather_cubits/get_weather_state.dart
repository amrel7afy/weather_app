


import 'package:weather_app/models/weather_model.dart';

abstract class GetWeatherState {}

class GetWeatherInitial extends GetWeatherState {}
class GetWeatherLoading extends GetWeatherState {}
class GetWeatherSuccess extends GetWeatherState {

  WeatherModel weatherData;

  GetWeatherSuccess(this.weatherData);
}
class GetWeatherFailure extends GetWeatherState {
  String error;
  GetWeatherFailure(this.error);
}
