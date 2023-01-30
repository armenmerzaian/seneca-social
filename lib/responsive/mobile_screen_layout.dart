import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seneca_social/providers/user_provider.dart';
import 'package:seneca_social/models/user.dart' as model;

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  @override
  Widget build(BuildContext context) {
    model.User user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      body: Center(
        child: Text("Hi ${user.username}!"),
      ),
    );
  }
}
