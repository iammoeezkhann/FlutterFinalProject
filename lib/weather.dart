import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String _city = '';
  String _weatherDescription = '';
  double _temperature = 0.0;
  double _feelsLikeTemperature = 0.0;
  String _weatherIcon = '';

  Location location = Location();

  @override
  void initState() {
    super.initState();
    getLocationAndWeather();
  }

  Future<void> getLocationAndWeather() async {
    try {
      var locationData = await location.getLocation();
      var latitude = locationData.latitude;
      var longitude = locationData.longitude;

      final apiKey =
          '3bc017be42020c847d30042f21153677'; // Replace with your own API key
      final url =
          'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric';

      var response = await http.get(Uri.parse(url));
      var result = jsonDecode(response.body);

      setState(() {
        _city = result['name'];
        _weatherDescription = result['weather'][0]['description'];
        _temperature = result['main']['temp'];
        _feelsLikeTemperature = result['main']['feels_like'];
        _weatherIcon = result['weather'][0]['icon'];
      });
    } catch (e) {
      print('Error getting weather data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
        backgroundColor: Colors.red[700],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$_city',
              style: TextStyle(fontSize: 24.0),
            ),
            Image.network(
              'https://openweathermap.org/img/w/$_weatherIcon.png',
              height: 100.0,
            ),
            Text(
              '$_weatherDescription',
              style: TextStyle(fontSize: 24.0),
            ),
            Text(
              'Temperature: $_temperature°C',
              style: TextStyle(fontSize: 24.0),
            ),
            Text(
              'Feels like: $_feelsLikeTemperature°C',
              style: TextStyle(fontSize: 24.0),
            ),
          ],
        ),
      ),
    );
  }
}
