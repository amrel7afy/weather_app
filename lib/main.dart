import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/cubits/get_weather_cubits/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubits/get_weather_state.dart';
import 'package:weather_app/locator.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_service.dart';

import 'cubits/bloc_observer.dart';

void main() {
  //setupLocator();
  Bloc.observer=MyBlocObserver();
  runApp(BlocProvider(
    create: (context) => GetWeatherCubit(WeatherService()),
    child: const WeatherApp(),
  ));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: context.read<GetWeatherCubit>().weatherData == null ?  Colors.blue : context.read<GetWeatherCubit>().weatherData!.getThemeColor()
        ),
        primarySwatch: context.read<GetWeatherCubit>().weatherData == null ?  Colors.blue : context.read<GetWeatherCubit>().weatherData!.getThemeColor()  ,
      ),
      home: HomePage(),
    );
  }
}
