import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/data/my_location.dart';
import 'package:weather_app/data/network.dart';

import 'weather_screen.dart';
// This is to access variable name from .env file

final apikey = dotenv.env['apikey'];

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  double? currentLatitude;
  double? currentLongitude;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();

    currentLatitude = myLocation.latitude;
    currentLongitude = myLocation.longitude;

    debugPrint('위도: $currentLatitude, 경도:$currentLongitude');

    Network network = Network(
        'https://api.openweathermap.org/data/2.5/weather?lat=$currentLatitude&lon=$currentLongitude&appid=$apikey&units=metric',
        'http://api.openweathermap.org/data/2.5/air_pollution?lat=$currentLatitude&lon=$currentLongitude&appid=$apikey');

    var weatherData = await network.getJsonData();
    debugPrint(weatherData.toString());

    var airData = await network.getAirData();
    debugPrint(airData.toString());

    if (!mounted) return;

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WeatherScreen(
        parseWeatherData: weatherData,
        parseAirPollution: airData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue,
              Colors.red,
            ],
          ),
        ),
        child: const Center(
          child: SpinKitDoubleBounce(
            color: Colors.white,
            size: 80.0,
          ),
        ),
      ),
    );
  }
}
