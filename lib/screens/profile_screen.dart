import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seneca_social/models/user.dart';
import 'package:seneca_social/providers/user_provider.dart';
import 'package:seneca_social/screens/customize_profile.dart';

import 'package:seneca_social/services/firestore_methods.dart';
import 'package:seneca_social/utils/colors.dart';
import 'package:seneca_social/utils/utils.dart';
import 'package:seneca_social/widgets/comment_card.dart';
import 'package:seneca_social/services/storage_methods.dart';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Profile',
          style: TextStyle(color: Colors.red),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(user.profileImgUrl),
            ),
          ),
          Text(
            user.username,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            user.email,
            style: const TextStyle(fontSize: 16),
          ),
          const Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Text(
              user.biography,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          const Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          Container(
            child: ElevatedButton(
              child: Text(
                'Edit Profile',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CustomizeProfile()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
