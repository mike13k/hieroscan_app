import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class image2 extends StatefulWidget {
  image2() : super();
  // const translatepage({Key? key}) : super(key: key);

  @override
  _image2State createState() => _image2State();
}

class _image2State extends State<image2> {
  // the text entered by the user
  String enteredText = '';

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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: InkWell(
                    onTap: () {},
                    child: Stack(
                      children: <Widget>[
                        Image.asset(
                          "classification1.png",
                          width: 400,
                          height: 400,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Transliteration",
                  style: GoogleFonts.courgette(
                      textStyle: TextStyle(
                        color: Color(0xFFF8B232),
                      ),
                      fontSize: 28),
                ),
                Center(
                  child: Text(
                    "'ngsgs  .f n Hnskt  q dwA wr dwA wr dwA wr n k n', 'n Hnskt dwA wr n g wnwty jj pn      ', 'bw k p k mnkrt wsi w wsi p gAp', 'Hnskt k k .f k j imn j srw .s smn Hnk k kft ', 'k m HAm d A wnwty wnwty dwA wr   '",
                    style: GoogleFonts.courgette(
                        textStyle: TextStyle(
                          color: Color(0xFFF8B232),
                        ),
                        fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Transliteration",
                  style: GoogleFonts.courgette(
                      textStyle: TextStyle(
                        color: Color(0xFFF8B232),
                      ),
                      fontSize: 28),
                ),
                Center(
                  child: Text(
                    "'and the parts of the two lands of the sea to the sea', 'and the fish of the waterside speak to come', 'and the parts of upper egypt of lower egypt snofru the justified', 'and the parts of the two sides kneeling to the officials who have been folded.', 'and fish of the roads to the sea'",
                    style: GoogleFonts.courgette(
                        textStyle: TextStyle(
                          color: Color(0xFFF8B232),
                        ),
                        fontSize: 20),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
