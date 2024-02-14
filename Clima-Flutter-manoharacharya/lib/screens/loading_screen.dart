import 'dart:developer';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/networking.dart';
import 'location_screen.dart';

const apikeys = 'c730897961e04a11b3455805231110';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? latitude = 0.0;
  double? lonitude = 0.0;
  @override
  void initState() {
    super.initState();
    getlocation();
     
  }

  void getlocation() async {
    location locationobject = location();
    await locationobject.getlocation();
    latitude = locationobject.latitude;
    lonitude = locationobject.lonitude;
    networkhelper Networkhelper = networkhelper(
        'https://api.weatherapi.com/v1/current.json?key=$apikeys&q=$latitude,$lonitude');

    var weatherdata = await Networkhelper.getdata();
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return LocationScreen(locationweather: weatherdata,);
        
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:SpinKitSpinningLines(
  color: Colors.white,
  size: 500.0,
)
      ),
    );
  }
}
