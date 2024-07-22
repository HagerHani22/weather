import 'package:flutter/cupertino.dart';
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
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: weatherData == null
          ? AppBar(
              backgroundColor: Colors.blue,
              title: const Text(
                'Weather App',
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Search(
                              // updateUi: updateUi,
                              )));
                    },
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ))
              ],
            )
          : AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Search()));
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
          : Center(
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  colors: [Colors.blue, Colors.white],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                )),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        weatherData!.location!.name!,
                        style: const TextStyle(fontSize: 30),
                      ),
                      const Icon(Icons.location_on_outlined),
                      const SizedBox(
                        height: 8,
                      ),
                      Image(image: NetworkImage('https:${weatherData!.current!.condition!.icon}')),
                      Text(
                        '${weatherData!.current!.tempC?.ceil()} °C',
                        style: const TextStyle(fontSize: 60),
                      ),
                      Text(weatherData!.current!.condition!.text!),
                      Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, i) =>
                                Row(
                                  children: [
                                    Text(weatherData!.forecast!.forecastday![i].date!),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    i==0?const Text('Today'):const Text(''),
                                    const Spacer(),
                                    Text('${weatherData!.forecast!.forecastday![i].day!.mintempC} '),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text('${weatherData!.forecast!.forecastday![i].day!.maxtempC} '),
                                  ],
                                ),
                            separatorBuilder: (context, index) => const Divider(),
                            itemCount: weatherData!.forecast!.forecastday!.length),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

