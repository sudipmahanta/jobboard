import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:jobboard/constants/pref_strings/preferences_string.dart';
import 'package:jobboard/constants/utils/colors.dart';
import 'package:jobboard/view/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/utils/input_field/password_input_field.dart';
import '../../constants/utils/jobboard_button/primary_button.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  //Email and Password Controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();

  final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Welcome, Glad to see you.',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Login to get Started',
                        style: TextStyle(
                            fontSize: 12,
                            letterSpacing: 0.5,
                            color: JobBoardColors.secoundaryColor),
                      ),
                    ],
                  ),
                ),

                // Login Form
                Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: emailController,
                        validator: (value) => EmailValidator.validate(value!) ? null : "Please enter a valid email",
                        decoration: const InputDecoration(
                          hintText: 'Email'
                        ),
                      ),
                      PasswordInputField(
                          hintText: 'Password',
                          controller: pwdController
                      )
                    ],
                  ),
                ),
                SizedBox(height: height * 0.02),

                //Recover Password
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {

                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                          color: JobBoardColors.primaryColor,
                          fontSize: 12.0),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.02),

                PrimaryButton(
                  label: 'SIGN IN',
                  onPressed: () async{
                    if(formKey.currentState!.validate()){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                    }
                    SharedPreferences pref = await SharedPreferences.getInstance();
                    pref.setString(PrefString.email, emailController.text);
                  },
                ),
              ]),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Don\'t have account ? ',
              style: TextStyle(
                //color: Color(0xFF653bbf),
                  fontSize: 12.0),
            ),
            InkWell(
                onTap: () {
                },
                child: Text(
                  'Signup',
                  style: TextStyle(
                      color: JobBoardColors.primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.0),
                )),
          ],
        ),
      ),
    );
  }
}
