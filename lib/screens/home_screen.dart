import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'edit_image_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  XFile? _imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () async {
                  try {
                    XFile? file = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    if (file != null) {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return EditImageScreen(
                            selectedImage: file.path,
                          );
                        },
                      ));
                    }
                  } catch (e) {
                    print(e.toString());
                  }
                },
                icon: const Icon(
                  Icons.add_a_photo,
                  size: 44,
                )),
          ],
        ),
      ),
    );
  }
}
/*
*  Image.file(
              File(_imageFile!.path),
              width: 200,
              height: 200,
            )
            *
            *
            *
            * setState(() {
                        _imageFile = file;
                      });
* */
