import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wanderlust/screens/search_results_screen.dart';
import 'package:wanderlust/screens/destination_details_screen.dart';
import 'package:wanderlust/screens/signin_screen.dart';
import 'package:wanderlust/screens/travel_planner_screen.dart';
import 'package:wanderlust/screens/my_trips_screen.dart';
import 'package:wanderlust/screens/profile_screen.dart';
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchResultsScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                // MaterialPageRoute(builder: (context) => LoginRegistrationScreen()),
                MaterialPageRoute(builder: (context) => SignInScreen()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to Wanderlust!'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TravelPlannerScreen()),
                );
              },
              child: Text('Go to Travel Planner'),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
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
                Navigator.pop(context);
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
              title: Text('Current Trip'),
              onTap: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyTripsScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
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
                FirebaseAuth.instance.signOut().then((value) {
                  print("Signed out");
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignInScreen()));
                });
                },
              //},
            ),
          ],
        ),
      ),
    );
  }
}