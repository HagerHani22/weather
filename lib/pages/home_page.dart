import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/pages/search.dart';
import 'package:weather/providers/weather_provider.dart';

import '../models/weather_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel? weatherData;
  // void updateUi() {
  //   setState(() {
  //
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    weatherData=Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar:weatherData == null?
      AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Weather App',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Search(
                  // updateUi: updateUi,
                )));
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ))
        ],
      ):AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Search()));
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ))
        ],
      ),
      body: weatherData == null
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'No weather found 🌡',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'Start searching now 🔎',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            )
          :
        Center(
          child: Container(decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.white],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              )
          ),
            child:  Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(height: 50,),
                  Text(weatherData!.cityName,style: const TextStyle(fontSize: 30),),
                  const Icon(Icons.location_on_outlined),
                  const SizedBox(height: 8,),
                  Image(image: NetworkImage('https:${weatherData!.icon}')),
                  Text('${weatherData!.temp}', style: const TextStyle(fontSize: 70),),
                  Text(weatherData!.weatherStateName),
                  const SizedBox(height: 50,),
                  Row(
                    children: [
                      Text(weatherData!.date),
                      const SizedBox(width: 10,),
                      const Text('Today'),
                      const Spacer(),
                      Text('${weatherData!.minTemp} '),
                      const SizedBox(width: 10,),
                      Text('${weatherData!.maxTemp} '),
                    ],
                  ),
                  const Divider()
                ],
              ),
            ),
          ),
        ),
    );
  }
}





