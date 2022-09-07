import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login02/screens/forgot_password.dart';
import 'package:login02/screens/home_screen.dart';
import 'package:login02/screens/signup_screen.dart';
import 'package:login02/service/firebase_auth_service.dart';
import 'package:login02/widgets/customized_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/customized_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
                  padding: const EdgeInsets.all(12.0),
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
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Welcome back! Glad \n to see you Again!',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CotomizedTextfield(
                  myController: _emailController,
                  hintText: 'Enter you Email',
                  isPassword: false,
                ),
                CotomizedTextfield(
                  myController: _passwordController,
                  hintText: 'Enter you Password',
                  isPassword: true,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ForgotPassword(),
                          ),
                        );
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Color(0xFF6EA225),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
                CustomizedButton(
                  bottonText: 'Login',
                  buttonColor: Colors.black,
                  textColor: Colors.white,
                  onPressed: () async {
                    try {
                      await FirebaseAuthService().login(
                        _emailController.text.trim(),
                        _passwordController.text.trim(),
                      );
                      if (FirebaseAuth.instance.currentUser != null) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => HomeScreen()));
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text(
                                      'Invalid Username or password.Please register again or make sure that username and password is corrrect.'),
                                  actions: [
                                    ElevatedButton(
                                      child: Text('Register now'),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SignUpScreen()));
                                      },
                                    )
                                  ],
                                ));
                      }
                    } on FirebaseException catch (e) {
                      print(e.message);
                    }
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (_) => const LoginScreen(),
                    //   ),
                    // );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Container(
                        height: 1,
                        width: MediaQuery.of(context).size.height * 0.4,
                        color: Colors.grey,
                      ),
                      Text('Or Login with'),
                      Container(
                        height: 1,
                        width: MediaQuery.of(context).size.height * 0.4,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
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
                          icon: Icon(
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
                          icon: Icon(
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
                          icon: Icon(
                            Icons.apple,
                            color: Colors.red,
                          ),
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(58, 8, 8, 8.0),
                  child: Row(
                    children: [
                      Text(
                        'Dont have an accound?',
                        style: TextStyle(
                          color: Color(
                            0xFF6A707C,
                          ),
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        ' Register now',
                        style: TextStyle(
                          color: Color(0xFF35c2C1),
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
