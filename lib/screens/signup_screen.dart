import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seneca_social/styles/button_styles.dart';
import 'package:seneca_social/utils/svg_strings.dart';
import 'package:seneca_social/widgets/text_field_input.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(child: Container(), flex: 2),
                //svg image
                SvgPicture.asset(
                  senecaLogo,
                  height: 64,
                ),
                const SizedBox(height: 64),
                //text field input email
                TextFieldInput(
                    textEditingController: _emailController,
                    hintText: 'Enter your email',
                    textInputType: TextInputType.emailAddress),
                const SizedBox(
                  height: 24,
                ),
                //text field for password
                TextFieldInput(
                    textEditingController: _passwordController,
                    hintText: 'Enter your Password',
                    textInputType: TextInputType.text,
                    isPassword: true),
                const SizedBox(
                  height: 24,
                ),
                //login button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: primaryButtonStyle,
                    onPressed: (() {}),
                    child: const Text("Sign In"),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Flexible(child: Container(), flex: 2),
                //sign up button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "New here? ",
                      style: TextStyle(color: Colors.black54),
                    ),
                    TextButton(
                      style:
                          TextButton.styleFrom(foregroundColor: Colors.black),
                      onPressed: (() {}),
                      child: const Text("Sign Up"),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}