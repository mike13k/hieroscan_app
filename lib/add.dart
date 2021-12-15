import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:file_picker/file_picker.dart';
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
                  const SizedBox(height: 40),
                  ButtonTheme(
                minWidth: 50.0,
                height: 80.0,
                // ignore: deprecated_member_use
                child:RaisedButton(
                onPressed: () {
                      pickImage();
                    },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
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
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
    ),
    child: Container(
      constraints: const BoxConstraints(minWidth: 30.0, minHeight: 80.0), // min sizes for Material buttons
      alignment: Alignment.center,
      width: 200,
      height: 10,
      child:  Text(
        'Upload Image',
        textAlign: TextAlign.center,
        style:GoogleFonts.courgette(fontSize: 18),
      ),
    ),
  ),
)
              ),
                 
                  showImage(),
                  Container(
                      width: 350.0,
                      child:  TextField(

                    style: TextStyle(color: Colors.white),
                     cursorColor: Color(0xFFF8B232),
                      decoration: InputDecoration(    
                         prefixIcon: const Icon(
                            Icons.image_search,
                            color: Color(0xFFF8B232),
                          ),                        
                        filled: true,
                        fillColor: Colors.black,
                    focusedBorder: OutlineInputBorder(
                      
                      
                      borderSide: const BorderSide(
                        color: Color(0xFFF8B232),
                      ),
                      
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      
                      
                      borderSide: BorderSide(
                        color: Color(0xFFF8B232),

                      ),
                      borderRadius: BorderRadius.circular(10.0),),
                    hintText: "Translation",
                    hintStyle: TextStyle( color: Colors.grey),
                  )),
                      ),
                       SizedBox(height: 30),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
          padding: const EdgeInsets.all(30),
          textColor: Colors.black,
          color: Color(0xFFF8B232),
          onPressed: () =>  {},
          child: Text('Submit',style:GoogleFonts.courgette(fontSize: 18),),
        ),
                ],
              ),
            ),
          ],
        ));
  }
}
