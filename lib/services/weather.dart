import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';

const apikey='75072eb95f77362828d73057487697fd';
const openweathermapURL='https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic> getcityweather(String cityname)async{
    var url='$openweathermapURL?q=$cityname&appid=$apikey&units=metric';
    Networkhelper networkhelper=Networkhelper(url);
    var weatherdata=await networkhelper.getData();
    return weatherdata;
  }
  Future<dynamic> getlocationweather() async {
    Location location = Location();
    await location.getcurrentlocation();

    Networkhelper networkhelper= Networkhelper('${openweathermapURL}?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric');

    var weatherdata= await networkhelper.getData();
    return weatherdata;
  }


  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
