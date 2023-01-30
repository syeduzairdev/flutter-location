import 'package:flutter/foundation.dart';
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
    try {
      _currentLocation =
          await LocationService.instance.getCurrentLocation(context);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _currentLocation != null
            ? Text(
                'Latitude: ${_currentLocation!.latitude}\nLongitude: ${_currentLocation!.longitude}')
            : InkWell(
                onTap: () => _getCurrentLocation(),
                child: const Text('Get Location')),
      ),
    );
  }
}
