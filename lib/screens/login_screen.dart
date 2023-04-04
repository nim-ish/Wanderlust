import 'package:flutter/material.dart';

class LoginRegistrationScreen extends StatelessWidget {
  const LoginRegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Login/Register'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Wanderlust app logo
            Image.asset(
              'assets/images/wanderlust_logo.png',
              height: 120.0,
              width: 120.0,
            ),
            SizedBox(height: 24.0),
            // Title
            Text(
              'Welcome to Wanderlust',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24.0),
            // Login Form
            TextField(
              decoration: InputDecoration(
                labelText: 'Email/Username',
              ),
            ),
            SizedBox(height: 12.0),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 12.0),
            TextButton(
              onPressed: () {
                // Forgot password action
              },
              child: Text('Forgot Password?'),
            ),
            SizedBox(height: 24.0),
            // Register Button
            ElevatedButton(
              onPressed: () {
                // Login action
              },
              child: Text('Login'),
            ),
            SizedBox(height: 12.0),
            // Divider
            Divider(
              thickness: 1.0,
              color: Colors.grey,
            ),
            SizedBox(height: 12.0),
            // Alternative Login/Registration Options
            ElevatedButton.icon(
              onPressed: () {
                // Login with Google action
              },
              icon: Icon(Icons.g_translate),
              label: Text('Login with Google'),
            ),
            SizedBox(height: 12.0),
            ElevatedButton.icon(
              onPressed: () {
                // Register with Facebook action
              },
              icon: Icon(Icons.facebook),
              label: Text('Register with Facebook'),
            ),
            SizedBox(height: 24.0),
            // Call-to-Action
            Text(
              'Join Wanderlust and start exploring the world!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}