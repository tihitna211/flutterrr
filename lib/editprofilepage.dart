import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

class profileEdit extends StatefulWidget {
  const profileEdit({super.key});

  @override
  State<profileEdit> createState() => _profileEditState();
}

class _profileEditState extends State<profileEdit> {
  final ImagePicker picker = ImagePicker();
  XFile? image;
  void imagegal() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  void imagecam() async {
    image = await picker.pickImage(source: ImageSource.camera);
    setState(() {});
  }

  void showimage(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SizedBox(
              height: 150,
              child: Column(
                children: [
                  Text('pick image'),
                  ListTile(
                    onTap: () {
                      imagegal;
                    },
                    leading: Icon(Icons.camera),
                    title: Text('from camera'),
                  ),
                  ListTile(
                    onTap: () {
                      imagecam;
                    },
                    leading: Icon(Icons.browse_gallery),
                    title: Text('from gallery'),
                  ),
                  TextButton(
                    child: Text('cancel'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              )),
        );
      },
    );
  }

  bool VisibleText = true;
  var error = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Column(
        children: [
          Container(
            height: 300,
            child: Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 70,
                    child: (image != null)
                        ? Image.file(File(image!.path))
                        : Icon(
                            Icons.person_2,
                          ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 10,
                    child: IconButton(
                      icon: Icon(
                        Icons.camera_alt,
                      ),
                      onPressed: () {
                        return showimage(context);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Text(
            'Name',
            textAlign: TextAlign.left,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextField(
            decoration: InputDecoration(hintText: 'name'),
          ),
          Text(
            'email',
            textAlign: TextAlign.left,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextField(
            decoration: InputDecoration(hintText: 'email'),
          ),
          Text(
            'password',
            textAlign: TextAlign.left,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextFormField(
            obscureText: VisibleText,
            onChanged: (value) {
              if (value.length < 8) {
                setState(() {
                  error = "too short";
                });
              } else if (value.length >= 8 && value.length < 12) {
                setState(() {
                  error = "medium";
                });
              }
              // ignore: curly_braces_in_flow_control_structures
              else {
                setState(() {
                  error = "good!";
                });
              }
              ;
            },
            decoration: InputDecoration(
              errorText: error,
              errorStyle: TextStyle(
                  color: (error == 'good!')
                      ? Colors.green
                      : (error == "too short")
                          ? Colors.red
                          : (error == 'medium')
                              ? Colors.amber
                              : null),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    VisibleText = !VisibleText;
                  });
                },
                icon: Icon((VisibleText)
                    ? Icons.visibility
                    : (!VisibleText)
                        ? Icons.visibility_off_outlined
                        : null),
              ),
              hintText: "password",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      )), //positioned(icon,bottom, left)
    );
  }
}
//