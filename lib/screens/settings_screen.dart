import 'package:flutter/material.dart';
import 'package:wanderlust/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:geolocator/geolocator.dart';
import 'package:app_settings/app_settings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isLocationEnabled = false;

  @override
  void initState() {
    super.initState();
    _loadSettings();
    _checkLocationEnabled();
  }

  void _loadSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isLocationEnabled = prefs.getBool('isLocationEnabled') ?? false;
    });
  }

  void _saveSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLocationEnabled', isLocationEnabled);
  }

  void _checkLocationEnabled() async {
    bool isEnabled = await Geolocator.isLocationServiceEnabled();
    setState(() {
      isLocationEnabled = isEnabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: kDefaultPadding),
            const Text(
              'Location Settings',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: kDefaultPadding),
            Visibility(
              visible: !isLocationEnabled,
              child: ElevatedButton(
                onPressed: () {
                  AppSettings.openLocationSettings();
                },
                child: const Text('Enable Location'),
              ),
            ),
            const SizedBox(height: kDefaultPadding),
            Text(
              'Location is ${isLocationEnabled ? 'enabled' : 'disabled'}.',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
