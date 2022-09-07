import 'package:flutter/material.dart';

class CotomizedTextfield extends StatelessWidget {
  const CotomizedTextfield({
    Key? key,
    required this.myController,
    this.hintText,
    this.isPassword,
  }) : super(key: key);

  final TextEditingController myController;
  final String? hintText;
  final bool? isPassword;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        keyboardType: isPassword!
            ? TextInputType.visiblePassword
            : TextInputType.emailAddress,
        enableSuggestions: isPassword! ? false : true,
        autocorrect: isPassword! ? false : true,
        obscureText: isPassword ?? true,
        controller: myController,
        decoration: InputDecoration(
          suffixIcon: isPassword!
              ? IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.remove_red_eye,
                    color: Colors.teal,
                  ))
              : null,
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFE8ECF4), width: 1),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFE8ECF4), width: 1),
              borderRadius: BorderRadius.circular(10)),
          fillColor: Color(0xFFE8ECF4),
          filled: true,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
