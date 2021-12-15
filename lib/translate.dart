import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:file_picker/file_picker.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:http/http.dart' as http;

class translatepage extends StatefulWidget {
  translatepage() : super();
  // const translatepage({Key? key}) : super(key: key);

  @override
  _translatepageState createState() => _translatepageState();
}

class TranslationResponse {
  final String translation;

  TranslationResponse({
    required this.translation,
  });

  factory TranslationResponse.fromJson(Map<String, dynamic> json) {
    return TranslationResponse(
      translation: json['title'],
    );
  }
}

class _translatepageState extends State<translatepage> {
  // the text entered by the user
  String enteredText = '';
  Future<Uint8List> imageFile = Future(() {
    return kTransparentImage;
  });
  late Future<TranslationResponse> futureTranslation;
  bool isFileSelected = false;

  @override
  void initState() {
    super.initState();
    futureTranslation = translateImage(null);
  }

  pickImage() async {
    var file = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['jpg', 'png']);
    isFileSelected = true;
    setState(() {
      // if (file != null) {
      imageFile = Future(() {
        futureTranslation = translateImage(file!.files.single.bytes);
        return file.files.single.bytes as Uint8List;
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

  Future<TranslationResponse> translateImage(imageBytes) async {
    if (!isFileSelected) {
      return TranslationResponse.fromJson(jsonDecode('{"title": ""}'));
    } else {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

      if (response.statusCode == 200) {
        return TranslationResponse.fromJson(jsonDecode(response.body));
      } else {
        return TranslationResponse.fromJson(jsonDecode('{"title": "Failed"}'));
      }
    }
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
                  FutureBuilder<TranslationResponse>(
                    future: futureTranslation,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(snapshot.data!.translation,
                            style: GoogleFonts.courgette(
                                textStyle: TextStyle(
                                    color: Color(0xFFF8B232), fontSize: 24)));
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }
                      // By default, show a loading spinner.
                      return const CircularProgressIndicator();
                    },
                  )
                ],
              ),
            )
          ],
        ));
  }
}
