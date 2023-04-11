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
import 'travel_history_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:wanderlust/utils/colors_util.dart';
import 'package:wanderlust/reusable_widgets/reusable_widget.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  final List<String> imagePaths = const [
    'images/slider1.jpg',
    'images/slider2.jpg',
    'images/slider3.jpg',
    'images/slider4.jpg',
    'images/slider5.jpg',
    'images/slider6.jpg',
  ];

  final List<String> touristPlaces = const [
    'Paris, France',
    'New York, USA',
    'Tokyo, Japan',
    'Sydney, Australia',
    'Rio de Janeiro, Brazil',
    'Cape Town, South Africa',
    'Machu Picchu, Peru',
    'Santorini, Greece',
    'Cairo, Egypt',
    'Dubai, United Arab Emirates',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wanderlust',),
        backgroundColor: Colors.deepOrangeAccent,
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
                MaterialPageRoute(builder: (context) => SignInScreen()),
              );
            },
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringToColor("CB2B93"),
              hexStringToColor("9546C4"),
              hexStringToColor("5E61F4"),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 50),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/travel.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Text(
                  'Welcome to Wanderlust!',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
              ),

              Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.8),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: CarouselSlider(
              items: imagePaths.map((imagePath) {
                return Container(
                  margin: EdgeInsets.all(1.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                      width: 1000.0,
                    ),
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                pauseAutoPlayOnTouch: true,
                viewportFraction: 0.8,
                height: 250, // Adjust the height of the slider
                scrollDirection: Axis.horizontal, // Set the direction of scrolling
                autoPlayCurve: Curves.fastOutSlowIn, // Adjust the curve of animation
                autoPlayInterval: Duration(seconds: 3), // Adjust the interval between slides
              ),
            ),
          ),
          Text("Popular Places",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 30),),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListView.builder(
                  itemCount: touristPlaces.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(
                        touristPlaces[index],
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
                        ),
                      ),
                    );
                  },
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TravelPlannerScreen()),
                    );
                  },
                  child: Text('Go to Travel Planner',
                    style: const TextStyle(
                        color: Colors.black87, fontWeight: FontWeight.normal, fontSize: 16),),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.pressed)){
                          return Colors.black26;
                        }
                        return Colors.white;
                      }),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                      )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.deepOrangeAccent,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.orange,
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
                leading: Icon(Icons.home, color: Colors.white,),
                title: Text('Home',style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.info, color: Colors.white,),
                title: Text('About',style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutScreen()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.card_travel, color: Colors.white,),
                title: Text('Current Trip',style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),),
                onTap: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyTripsScreen()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.person, color: Colors.white,),
                title: Text('Profile',style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.settings, color: Colors.white,),
                title: Text('Settings',style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsScreen()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.history, color: Colors.white,),
                title: Text('Travel History',style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TravelHistoryScreen()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.logout, color: Colors.white,),
                title: Text('Logout',style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),),
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
      ),
    );
  }
}