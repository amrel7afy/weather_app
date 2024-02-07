import 'dart:developer';

import 'package:bloc/bloc.dart';

import '../../models/weather_model.dart';
import '../../services/weather_service.dart';
import 'get_weather_state.dart';

class GetWeatherCubit extends Cubit<GetWeatherState> {
  WeatherService weatherService;
  WeatherModel? weatherData;
  String ?cityName;

  GetWeatherCubit(this.weatherService) : super(GetWeatherInitial());

  getWeather(String cityName) async {
    emit(GetWeatherLoading());
    try {
       weatherData = await weatherService.getWeather(
          cityName: cityName);
      log(weatherData!.weatherStateName);
      emit(GetWeatherSuccess(weatherData!));
    } catch (e) {
      log(e.toString());
      emit(GetWeatherFailure(e.toString()));
    }
  }
}
