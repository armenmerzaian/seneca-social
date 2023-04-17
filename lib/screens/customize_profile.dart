import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seneca_social/models/user.dart';
import 'package:seneca_social/providers/user_provider.dart';
import 'package:seneca_social/services/firestore_methods.dart';
import 'package:seneca_social/utils/colors.dart';
import 'package:seneca_social/utils/utils.dart';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:seneca_social/widgets/comment_card.dart';

class CustomizeProfile extends StatefulWidget {
  const CustomizeProfile({Key? key}) : super(key: key);

  @override
  State<CustomizeProfile> createState() => _CustomizeProfileState();
}

class _CustomizeProfileState extends State<CustomizeProfile> {
  Uint8List? _file;
  bool isLoading = false;
  final TextEditingController _descriptionController = TextEditingController();
  _selectImage(BuildContext parentContext) async {
    return showDialog(
      context: parentContext,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Upload a Profile Picture'),
          children: <Widget>[
            SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Take a photo'),
                onPressed: () async {
                  Navigator.pop(context);
                  Uint8List file = await pickImage(ImageSource.camera);
                  setState(() {
                    _file = file;
                  });
                }),
            SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Choose from Gallery'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(ImageSource.gallery);
                  setState(() {
                    _file = file;
                  });
                }),
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  void UpdateProfilePicture(String uid) async {
    setState(() {
      isLoading = true;
    });
    // start the loading
    try {
      // upload to storage and db
      String res = await FireStoreMethods().uploadProfilePicture(_file!, uid);
      if (res == "success") {
        setState(() {
          isLoading = false;
        });
        if (mounted) {
          showSnackBar(
            'Posted!',
            context,
          );
        }
        clearImage();
      } else {
        if (mounted) {
          showSnackBar(res, context);
        }
      }
    } catch (err) {
      setState(() {
        isLoading = false;
      });
      showSnackBar(
        err.toString(),
        context,
      );
    }
  }

  void clearImage() {
    setState(() {
      _file = null;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);

    return _file == null
        ? Center(
  child: Material(
    child: IconButton(
      icon: const Icon(
        Icons.upload,
      ),
      onPressed: () => _selectImage(context),
      iconSize: 200.0,
      color: Colors.green,
    ),
  ),
)
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.red,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: clearImage,
              ),
              centerTitle: false,
              actions: <Widget>[
                TextButton(
                  onPressed: () =>
                      UpdateProfilePicture(userProvider.getUser.uid),
                  child: const Text(
                    "Upload",
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0),
                  ),
                )
              ],
            ),
            // POST FORM
            body: Column(
              children: <Widget>[
                isLoading
                    ? const LinearProgressIndicator()
                    : const Padding(padding: EdgeInsets.only(top: 0.0)),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        userProvider.getUser.profileImgUrl,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: TextField(
                        controller: _descriptionController,
                        decoration: const InputDecoration(
                            hintText: "Enter a description...",
                            border: InputBorder.none),
                        maxLines: 8,
                      ),
                    ),
                    SizedBox(
                      height: 45.0,
                      width: 45.0,
                      child: AspectRatio(
                        aspectRatio: 487 / 451,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            fit: BoxFit.fill,
                            alignment: FractionalOffset.topCenter,
                            image: MemoryImage(_file!),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(),
              ],
            ),
          );
  }
}
