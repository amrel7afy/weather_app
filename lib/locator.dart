
import 'package:get_it/get_it.dart';
import 'package:weather_app/cubits/get_weather_cubits/get_weather_cubit.dart';
import 'package:weather_app/services/weather_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {

  //locator.registerLazySingleton<GetWeatherCubit>(() => GetWeatherCubit(WeatherService()));
  //locator.registerLazySingleton<WeatherService>(() => WeatherService());
}