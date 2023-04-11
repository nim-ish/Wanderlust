import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanderlust/screens/home_screen.dart';
import 'package:wanderlust/utils/colors_util.dart';
import 'package:wanderlust/reusable_widgets/reusable_widget.dart';
import 'signup_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log In", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
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
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("images/logo.png"),
                SizedBox(
                  height: 30,
                ),
                reusableTextField("Email", Icons.person_outline, false, _emailTextController),
                SizedBox(
                  height: 30,
                ),
                reusableTextField("Password", Icons.lock_outline, true, _passwordTextController),
                SizedBox(
                  height: 30,
                ),
                signInSignUpButton(context, true, () async {
                  try {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: _emailTextController.text,
                      password: _passwordTextController.text,
                    );
                    print("Logged In");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  } catch (error) {
                    print("Error: ${error.toString()}");
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Error"),
                          content: Text("Incorrect email or password."),
                          actions: [
                            TextButton(
                              child: Text("OK"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                }),
                signUpOption(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: TextStyle(color: Colors.white),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: Text(
            " Sign Up",
            style:
            TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

}
