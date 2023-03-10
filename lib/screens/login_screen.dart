import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seneca_social/screens/signup_screen.dart';
import 'package:seneca_social/services/auth_methods.dart';
import 'package:seneca_social/utils/svg_strings.dart';
import 'package:seneca_social/utils/utils.dart';
import 'package:seneca_social/widgets/progress_circle.dart';
import 'package:seneca_social/widgets/text_field_input.dart';
import 'package:seneca_social/styles/button_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void logIn() async {
    setState(() {
      _isLoading = true;
    });
    String response = await AuthMethods().loginUser(
        email: _emailController.text, password: _passwordController.text);
    setState(() {
      _isLoading = false;
    });
    if (response != 'success') {
      if(mounted){
        showSnackBar(response, context);
      }
    } else {
      // login success
      //do nothing, streambuilder on main component will rerender
    }
  }

  void navigateSignUp() async {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
        ));
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
                Flexible(flex: 2, child: Container()),
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
                    onPressed: (logIn),
                    child: _isLoading
                        ? const ProgressCircle()
                        : const Text("Sign In"),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Flexible(flex: 2, child: Container()),
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
                      onPressed: (navigateSignUp),
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
