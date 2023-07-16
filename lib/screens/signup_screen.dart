import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanderlust/screens/home_screen.dart';
import 'package:wanderlust/utils/colors_util.dart';
import 'package:wanderlust/reusable_widgets/reusable_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  bool _isUsernameSaved = false;

  void _saveUserName(String username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        //backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Sign Up", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepOrangeAccent,
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
        child: SingleChildScrollView(child: Padding(
          padding: EdgeInsets.fromLTRB(
              20, 120, 20, 0),
          child: Column(children: <Widget>[
            logoWidget("images/logo.png"),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Enter Username",
                labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
                filled: true,
                prefixIcon: Icon(Icons.person_outline, color: Colors.white),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                fillColor: Colors.white.withOpacity(0.3),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
              ),
              style: TextStyle(color: Colors.white.withOpacity(0.9)),
              controller: _userNameTextController,
              onChanged: (username) {
                _saveUserName(username);
              },
            ),
            SizedBox(
              height: 30,
            ),
            reusableTextField("Enter Email Id", Icons.person_outline, false, _emailTextController),
            SizedBox(
              height: 30,
            ),
            reusableTextField("Enter Password", Icons.lock_outline, true, _passwordTextController),
            SizedBox(
              height: 30,
            ),
            signInSignUpButton(context, false, () {
              FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: _emailTextController.text,
                  password: _passwordTextController.text).then((value) {
                    print("Created New Account");
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  HomeScreen()));
                  }
                  ).onError((error, stackTrace){ 
                    print("Error ${error.toString()}");
              });
            }
            )
          ],
          ),
        ),),
      ),
    );
  }
}
