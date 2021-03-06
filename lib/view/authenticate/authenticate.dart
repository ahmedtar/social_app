import 'package:flutter/material.dart';
import 'package:social_app/view/authenticate/login_page.dart';
import 'package:social_app/view/authenticate/register_page.dart';
import 'package:social_app/view/shared/constants.dart';

class Authenticate extends StatefulWidget {
  static const String id = 'authenticate';
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/back.jpg'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'WELCOME TO ARTINESS',
                textAlign: TextAlign.center,
                style: kAdminHeaderTextStyle,
              ),
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Material(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.purple[300],
                  child: MaterialButton(
                      height: 60,
                      child: Text('Log in',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'JosefinSans',
                          )),
                      onPressed: () {
                        Navigator.pushNamed(context, LoginPage.id);
                      }),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Material(
                  color: Colors.blue[700],
                  elevation: 10,
                  borderRadius: BorderRadius.circular(10),
                  child: MaterialButton(
                      height: 60,
                      child: Text('Register',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'JosefinSans',
                          )),
                      onPressed: () {
                        Navigator.pushNamed(context, Register.id);
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
