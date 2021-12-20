import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/images.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:file_picker/file_picker.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;

class translatepage extends StatefulWidget {
  translatepage() : super();
  // const translatepage({Key? key}) : super(key: key);

  @override
  _translatepageState createState() => _translatepageState();
}

class TranslationResponse {
  final String translation;
  final String transliteration;
  final String image;

  TranslationResponse(
      {required this.translation,
      required this.transliteration,
      required this.image});

  factory TranslationResponse.fromJson(Map<String, dynamic> json) {
    return TranslationResponse(
        translation: json['translation'],
        transliteration: json['transliteration'],
        image: json['image']);
  }
}

class _translatepageState extends State<translatepage> {
  // the text entered by the user
  String enteredText = '';

  // transparent image as a default
  Future<Uint8List> imageFile = Future(() {
    return kTransparentImage;
  });

  // furture translation from api
  late Future<TranslationResponse> futureTranslation;

  // true if is file selected by user
  bool isFileSelected = false;

  @override
  void initState() {
    super.initState();
    futureTranslation = translateImageRequest(null);
  }

  // Triggered on pick image button click
  onPickImageClick() async {
    var file = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['jpg', 'png']);
    isFileSelected = true;

    if (file != null) {
      var image = file.files.single.bytes as Uint8List;

      updateImage(image);
      translateImage(image);
    }
  }

  // Updates the image display. Fetches and updates the translation display
  translateImage(image) {
    setState(() {
      String encodedImage = base64.encode(image);

      // Translate and update translation using API
      futureTranslation = translateImageRequest(encodedImage);
    });
  }

  // Upddate the image display
  updateImage(image) {
    setState(() {
      imageFile = Future(() {
        return image;
      });
    });
  }

  Widget renderImageWidget() {
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

  Future<TranslationResponse> translateImageRequest(imageBytes) async {
    if (!isFileSelected) {
      return TranslationResponse.fromJson(jsonDecode(
          jsonEncode({"translation": "", "transliteration": "", "image": ""})));
    }

    final response = await http.post(
        Uri.parse('https://PureStarchyMouse.michaelkhalil2.repl.co/translate'),
        headers: {"Content-Type": "application/json"},
        body: json.encode({"image": imageBytes}));

    if (response.statusCode == 200) {
      var image = jsonDecode(response.body)['image'];
      image = image.replaceAll("\n", "");

      updateImage(base64.decode(image));
      return TranslationResponse.fromJson(jsonDecode(response.body));
    } else {
      return TranslationResponse.fromJson(
          jsonDecode('{"translation": "Failed"}'));
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
                  const SizedBox(height: 100),
                  ButtonTheme(
                      minWidth: 50.0,
                      height: 80.0,
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (BuildContext context) {
                              return images();
                            }),
                          )
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        padding: const EdgeInsets.all(0.0),
                        child: Ink(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: <Color>[
                                Color(0xFFF8B232),
                                Color(0xFFF8B232),
                                // Color(0xFFFFFFFF),
                              ],
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                          child: Container(
                            constraints: const BoxConstraints(
                                minWidth: 30.0,
                                minHeight:
                                    80.0), // min sizes for Material buttons
                            alignment: Alignment.center,
                            width: 200,
                            height: 10,
                            child: Text(
                              'Gallery',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.courgette(fontSize: 18),
                            ),
                          ),
                        ),
                      )),
                  const SizedBox(height: 50),
                  ButtonTheme(
                      minWidth: 50.0,
                      height: 80.0,
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        onPressed: () {
                          onPickImageClick();
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        padding: const EdgeInsets.all(0.0),
                        child: Ink(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: <Color>[
                                Color(0xFFF8B232),
                                Color(0xFFF8B232),
                                // Color(0xFFFFFFFF),
                              ],
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                          child: Container(
                            constraints: const BoxConstraints(
                                minWidth: 30.0,
                                minHeight:
                                    80.0), // min sizes for Material buttons
                            alignment: Alignment.center,
                            width: 200,
                            height: 10,
                            child: Text(
                              'Image Translation',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.courgette(fontSize: 18),
                            ),
                          ),
                        ),
                      )),

                  // RaisedButton(
                  //   child: Text('Try a sample image'),
                  //   onPressed: () {
                  //     isRandomImage = true;
                  //     pickImage();
                  //   },
                  // ),
                  renderImageWidget(),
                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child: FutureBuilder<TranslationResponse>(
                        future: futureTranslation,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text(snapshot.data!.transliteration,
                                style: GoogleFonts.courgette(
                                    textStyle: TextStyle(
                                        color: Color(0xFFF8B232),
                                        fontSize: 24)));
                          } else if (snapshot.hasError) {
                            return Text('${snapshot.error}');
                          }
                          // By default, show a loading spinner.
                          return const CircularProgressIndicator();
                        },
                      )),
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
