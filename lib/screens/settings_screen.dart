import 'package:flutter/material.dart';
import 'package:wanderlust/constants.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkMode = false;

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
            Text(
              'Appearance',
              style: Theme.of(context).textTheme.headline6,
            ),
            SwitchListTile(
              title: const Text('Dark Mode'),
              value: isDarkMode,
              onChanged: (value) {
                setState(() {
                  isDarkMode = value;
                  final Brightness newBrightness =
                  isDarkMode ? Brightness.dark : Brightness.light;
                  final ThemeData newTheme =
                  ThemeData.from(colorScheme: ThemeData().colorScheme.copyWith(brightness: newBrightness));
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Theme(
                        data: newTheme,
                        child: const SettingsScreen(),
                      ),
                    ),
                  );
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}