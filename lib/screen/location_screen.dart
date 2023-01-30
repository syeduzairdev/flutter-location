import 'package:flutter/material.dart';
import 'package:location/location.dart';
import '../services/location_service/get_user_current_location.dart';

class MyCurrentLocationScreen extends StatefulWidget {
  const MyCurrentLocationScreen({Key? key}) : super(key: key);

  @override
  _MyCurrentLocationScreenState createState() =>
      _MyCurrentLocationScreenState();
}

class _MyCurrentLocationScreenState extends State<MyCurrentLocationScreen> {
  LocationData? _currentLocation;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    _currentLocation =
        await LocationService.instance.getCurrentLocation(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _currentLocation != null
            ? Text(
                'Latitude: ${_currentLocation!.latitude}\nLongitude: ${_currentLocation!.longitude}')
            : const CircularProgressIndicator(),
      ),
    );
  }
}
