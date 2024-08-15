import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/providers/weather_provider.dart';
import 'package:weather/service/service.dart';

class Search extends StatelessWidget {
  Search({super.key,
    // this.updateUi
  });
  String? cityName;
  // VoidCallback ?updateUi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        elevation: 0,
        title: const Text(
          "Search City",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: TextFormField(
          decoration: const InputDecoration(
            hintText: "Search",
            labelText: 'Enter city name',
            prefixIcon: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12))),
            contentPadding: EdgeInsets.all(16),
          ),
          onFieldSubmitted: (value) async {
            cityName = value;
            WeatherService service = WeatherService();
            // service.getWeather(cityName: cityName!);
            WeatherModel weather = await service.getWeather(cityName: cityName!);
            // weatherData = weather;
            Provider.of<WeatherProvider>(context, listen: false).weatherData = weather;
            // updateUi!();
            print('hhhhhhhhh$weather');
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

// WeatherModel ?weatherData;