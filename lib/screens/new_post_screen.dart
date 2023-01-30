import 'package:flutter/material.dart';
import 'package:seneca_social/utils/colors.dart';

class NewPostScreen extends StatefulWidget {
  const NewPostScreen({super.key});

  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("Create a New Post"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(flex: 2, child: Container()),
                //svg image
                TextField(),
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
                      onPressed: (){},
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