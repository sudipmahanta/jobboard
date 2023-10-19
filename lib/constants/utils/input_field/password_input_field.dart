import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class PasswordInputField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;

  const PasswordInputField({Key? key, required this.hintText, this.controller})
      : super(key: key);

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool showPassword = true;
  RegExp passwordValidate = RegExp(r'(?=.\d)(?=.*[A-Z])(?=.\W)');

  bool validatePassword(String password) {
    String password0 = password.trim();
    if(passwordValidate.hasMatch(password0)){
      return true;
    } else {
      return false;
    }
  }

  bool _isPasswordValid(String password) {
    RegExp passwordRegex = RegExp(
      r'^(?=.*[!@#\$%^&*()_+{}\[\]:;<>,.?~\\-])',
    );

    return passwordRegex.hasMatch(password);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: TextFormField(
        controller: widget.controller,
        style: Theme.of(context).textTheme.bodyMedium,
        validator: (value) {

          if (value == null || value.isEmpty) {
            return 'Please Enter Password';
          } else if (value.length < 6 || value.length > 10){
            return 'Password must be between 6 to 10 character';
          }else if(!_isPasswordValid(value)){
            return 'Password must be contain a special character';
          }else {
            return null;
          }

        },
        obscureText: showPassword,
        enableInteractiveSelection: false,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(
              color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 12.0),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                showPassword = !showPassword;
              });
            },
            child: Icon(
              showPassword ? Remix.eye_close_line : Remix.eye_line,
              size: 16,
            ),
          ),
        ),
      ),
    );
  }
}
