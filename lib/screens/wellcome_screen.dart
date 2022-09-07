import 'dart:html';

import 'package:flutter/material.dart';
import 'package:login02/screens/login_screen.dart';
import 'package:login02/screens/signup_screen.dart';
import 'package:login02/widgets/customized_button.dart';

class WellcomeScreen extends StatelessWidget {
  const WellcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.width,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'image/bakground1.png',
            ),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(
              height: 70,
              width: 120,
              child: Image(
                image: AssetImage('image/logo.png'),
              ),
            ),
            CustomizedButton(
              bottonText: 'Login',
              buttonColor: Colors.black,
              textColor: Colors.white,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()));
              },
            ),
            CustomizedButton(
              bottonText: 'Register',
              buttonColor: Colors.white,
              textColor: Colors.black,
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => SignUpScreen()));
              },
            ),
            const SizedBox(
              height: 7,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Container as a Guest',
                style: TextStyle(
                  color: Color(
                    0xFF35c2c1,
                  ),
                  fontSize: 22,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
