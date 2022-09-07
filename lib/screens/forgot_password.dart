import 'dart:html';

import 'package:flutter/material.dart';
import 'package:login02/widgets/customized_button.dart';
import 'package:login02/widgets/customized_textfield.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
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
                  'Forgot Password? ',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Dont worry it occurs to us al.\nWe will send you a link to reset your password',
                  style: TextStyle(
                    color: Color(0xFF8391a1),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              CotomizedTextfield(
                myController: _emailController,
                hintText: 'Inter you Email',
                isPassword: false,
              ),
              CustomizedButton(
                  bottonText: 'Send Code ',
                   buttonColor: Colors.black,
                   textColor: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                 ),
               Spacer(
                flex: 1,
               ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(68, 8, 8, 18.0),
                  child: Row(
                    children: [
                  const Text(
                        'Remember Password?',
                        style: TextStyle(
                          color: Color(
                            0xFF6A707C,
                          ),
                          fontSize: 15,
                        ),
                      ),
                      
                         const Text(
                          ' Login ',
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
    );
  }
}
