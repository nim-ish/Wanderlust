import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 75.0,
                backgroundImage: NetworkImage(
                    'https://example.com/profile_image.jpg'), // replace with the actual image URL
              ),
              SizedBox(height: 16.0),
              Text(
                'Nimish Gontiya', // fetch name from firebase
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Software Developer', // replace with the actual user's bio
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 24.0),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Trip History',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      ListTile(
                        title: Text('Destination 1'),
                        subtitle: Text('Dates: MM/DD/YYYY - MM/DD/YYYY'),
                        trailing: Text('Status: Completed'),
                        onTap: () {
                          // Handle trip detail click
                        },
                      ),
                      ListTile(
                        title: Text('Destination 2'),
                        subtitle: Text('Dates: MM/DD/YYYY - MM/DD/YYYY'),
                        trailing: Text('Status: Upcoming'),
                        onTap: () {
                          // Handle trip detail click
                        },
                      ),
                      // Add more trip history items as needed
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24.0),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Reviews and Recommendations',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      ListTile(
                        title: Text('Review 1'),
                        subtitle: Text('Destination: Destination 1'),
                        onTap: () {
                          // Handle review click
                        },
                      ),
                      ListTile(
                        title: Text('Review 2'),
                        subtitle: Text('Destination: Destination 2'),
                        onTap: () {
                          // Handle review click
                        },
                      ),
                      // Add more reviews and recommendations items as needed
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24.0),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Account Settings',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      ListTile(
                        title: Text('Edit Profile'),
                        trailing: Icon(Icons.edit),
                        onTap: () {
                          // Handle edit profile click
                        },
                      ),
                      ListTile(
                        title: Text('Change Password'),
                        trailing: Icon(Icons.lock),
                        onTap: () {
                          // Handle change password click
                        },
                      ),
                      ListTile(
                        title: Text('Notifications'),
                        trailing: Icon(Icons.notifications),
                        onTap: () {
                          // Handle notifications click
                        },
                      ),
                      ListTile(
                        title: Text('Privacy Settings'),
                        trailing: Icon(Icons.lock),
                        onTap: () {
                          // Handle privacy settings click
                        },
                      ),
                      // Add more account settings items as needed
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

