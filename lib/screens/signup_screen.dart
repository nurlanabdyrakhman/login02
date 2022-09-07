import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login02/screens/login_screen.dart';

import '../service/firebase_auth_service.dart';
import '../widgets/customized_button.dart';
import '../widgets/customized_textfield.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.blue),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Hello! Register to get  \n  Started',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CotomizedTextfield(
                  myController: _usernameController,
                  hintText: 'Username',
                  isPassword: false,
                ),
                CotomizedTextfield(
                  myController: _emailController,
                  hintText: 'Email',
                  isPassword: false,
                ),
                CotomizedTextfield(
                  myController: _confirmPasswordController,
                  hintText: 'Password',
                  isPassword: true,
                ),
                CotomizedTextfield(
                  myController: _passwordController,
                  hintText: 'Confirm Password',
                  isPassword: true,
                ),
                CustomizedButton(
                  bottonText: 'Register',
                  buttonColor: Colors.black,
                  textColor: Colors.white,
                  onPressed: () async {
                    try {
                      await FirebaseAuthService().signup(
                          _emailController.text.trim(),
                          _passwordController.text.trim());
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => LoginScreen()));
                    } on FirebaseException catch (e) {
                      print(e.message);
                    }

                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (_) => const LoginScreen()));
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Container(
                        height: 1,
                        width: MediaQuery.of(context).size.height * 0.4,
                        color: Colors.grey,
                      ),
                      Text('Or Register with'),
                      Container(
                        height: 1,
                        width: MediaQuery.of(context).size.height * 0.4,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Color(0xFF22EdF3),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.facebook,
                            color: Colors.blue,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Color(0xFF22EdF3),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          icon: const Icon(
                            FontAwesomeIcons.google,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Color(0xFF22EdF3),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.apple,
                            color: Colors.red,
                          ),
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(68, 8, 8, 18.0),
                  child: Row(
                    children: [
                      const Text(
                        'Already have an accound?',
                        style: TextStyle(
                          color: Color(
                            0xFF6A707C,
                          ),
                          fontSize: 15,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const LoginScreen()));
                        },
                        child: const Text(
                          ' Login now',
                          style: TextStyle(
                            color: Color(0xFF35c2C1),
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
