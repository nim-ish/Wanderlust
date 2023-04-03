import 'package:flutter/material.dart';
import 'package:wanderlust/screens/search_results_screen.dart';
import 'package:wanderlust/screens/destination_details_screen.dart';
import 'package:wanderlust/screens/travel_planner_screen.dart';
import 'package:wanderlust/screens/my_trips_screen.dart';
import 'package:wanderlust/screens/profile_screen.dart';
import 'package:wanderlust/screens/login_screen.dart';
import 'package:wanderlust/screens/recommendations_screen.dart';
import 'package:wanderlust/screens/settings_screen.dart';
import 'package:wanderlust/screens/about_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wanderlust'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => SearchScreen()),
              //);
            },
          ),
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => ProfileScreen()),
             // );
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Welcome to Wanderlust!'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => TravelPlannerScreen()),
          //);
        },
        child: Icon(Icons.add),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Wanderlust',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                // Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () {
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => AboutScreen()),
                 );
              },
            ),
            ListTile(
              leading: Icon(Icons.card_travel),
              title: Text('My Trips'),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => MyTripsScreen()),
                // );
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => ProfileScreen()),
                // );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => SettingsScreen()),
                 );
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => LoginScreen()),
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}
