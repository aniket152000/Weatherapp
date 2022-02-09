
import 'package:flutter/material.dart';

import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {        //to display latitude and longitude directly
    super.initState();
    getlocationdata();

  }
  void getlocationdata() async {
    var weatherdata=await WeatherModel().getlocationweather();

    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(
        locationweather: weatherdata,
      );
    }
    )
    );

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
