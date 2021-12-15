import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:transparent_image/transparent_image.dart';

class add extends StatefulWidget {
  add() : super();
  // const translatepage({Key? key}) : super(key: key);

  @override
  _addState createState() => _addState();
}

class _addState extends State<add> {
  // the text entered by the user
  String enteredText = '';
  Future<Uint8List> imageFile = Future(() {
    return kTransparentImage;
  });

  pickImage() async {
    var file = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['jpg', 'png']);
    setState(() {
      // if (file != null) {
      imageFile = Future(() {
        return file!.files.single.bytes as Uint8List;
      });
      // }
    });
  }

  Widget showImage() {
    return FutureBuilder<Uint8List>(
      future: imageFile,
      builder: (BuildContext context, AsyncSnapshot<Uint8List> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
          return Image.memory(snapshot.data!, width: 300, height: 300);
        } else {
          return const Text("Select Image");
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "HieroScan",
            style: GoogleFonts.courgette(
              textStyle: TextStyle(
                color: Color(0xFFF8B232),
              ),
            ),
          ),
          backgroundColor: const Color(0xFF000000),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("wall.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  RaisedButton(
                    child: Text('UPLOAD Your Image'),
                    onPressed: () {
                      pickImage();
                    },
                  ),
                  showImage(),
                  Container(
                      width: 700.0,
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: "Translation",
                            labelStyle: TextStyle(fontSize: 24),
                            filled: true,
                            fillColor: Colors.white70),
                        style: TextStyle(fontSize: 32),
                      ))
                ],
              ),
            ),
          ],
        ));
  }
}
