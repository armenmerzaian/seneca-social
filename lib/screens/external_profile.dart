import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:seneca_social/models/user.dart';

import '../models/post.dart';

class ExternalProfileScreen extends StatefulWidget {
  const ExternalProfileScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  State<ExternalProfileScreen> createState() => _ExternalProfileScreenState();
}

class _ExternalProfileScreenState extends State<ExternalProfileScreen> {
  late User _user;

  late List<Post> _posts = [];

  @override
  void initState() {
    super.initState();
    _fetchUserPosts();
    _user = widget.user;

    print(_user.username);
  }

  void _fetchUserPosts() async {
    final postsSnapshot =
        await FirebaseFirestore.instance.collection('posts').get();
    final posts = postsSnapshot.docs
        .map((doc) => Post.fromSnap(doc))
        .where((post) => post.uid == widget.user.uid)
        .toList();

    print(posts);
    setState(() {
      _posts = posts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_user.username),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.network(
                    widget.user.profileImgUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.user.fullname ?? '',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.user.username,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Biography',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  widget.user.biography ?? '',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  widget.user.email,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Text(
                  'Followers',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  widget.user.followers.toString(),
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Text(
                  'Following',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  widget.user.following.toString(),
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Text(
                  'Peers',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  widget.user.peers.toString(),
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Posts',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _posts.length,
              itemBuilder: (context, index) {
                final post = _posts[index];
                return ListTile(
                  title: Text("Post ${index + 1}"),
                  subtitle: Text(post.description),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(post.postUrl),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
