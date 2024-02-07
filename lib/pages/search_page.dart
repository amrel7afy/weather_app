import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/cubits/get_weather_cubits/get_weather_cubit.dart';


class SearchPage extends StatelessWidget {
String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onChanged: (data)
            {
               cityName = data;
               log(cityName!);
            },
            onSubmitted: (data) async {
              cityName = data;
              context.read<GetWeatherCubit>().getWeather(data);
              context.read<GetWeatherCubit>().cityName= cityName;
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              label: const Text('search'),
              suffixIcon: GestureDetector(
                onTap : () async 
                {
                  context.read<GetWeatherCubit>().getWeather(cityName!);
                  context.read<GetWeatherCubit>().cityName= cityName;
                  Navigator.pop(context);
                },
                child: const Icon(Icons.search)),
              border: const OutlineInputBorder(),
              hintText: 'Enter a city',
            ),
          ),
        ),
      ),
    );
  }
}

