import 'package:flutter/material.dart';
import 'package:seneca_social/screens/add_post_screen.dart';
import 'package:seneca_social/screens/home_screen.dart';

const webScreenSize = 600;

List<Widget> homeScreenItems = [
  const HomeScreen(),
  const Text("Search Screen!"),
  const AddPostScreen(),
  const Text("Activity Screen!"),
  const Text("Profile Screen!"),
];
