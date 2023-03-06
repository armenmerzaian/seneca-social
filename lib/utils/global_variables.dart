import 'package:flutter/material.dart';
import 'package:seneca_social/screens/add_post_screen.dart';
import 'package:seneca_social/screens/home_screen.dart';
import 'package:seneca_social/screens/new_post_screen.dart';
import 'package:seneca_social/screens/profile_screen.dart';

const webScreenSize = 600;

List<Widget> homeScreenItems = [
  const HomeScreen(),
  const Text("Search Screen!"),
  const AddPostScreen(),
  const Text("Activity Screen!"),
  const ProfileScreen()
 // const ProfileScreen(),
];
