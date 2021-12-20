import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class image3 extends StatefulWidget {
  image3() : super();
  // const translatepage({Key? key}) : super(key: key);

  @override
  _image3State createState() => _image3State();
}

class _image3State extends State<image3> {
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
                          "classification2.png",
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
                    "'pAxt p r hAyt r t .stAt t r xprS w H Hta r ', '.s sm sni n n n .s h rTn wab h', 'hyhy mwt rf b p pwnt n j h', 'm Smm n Tn Ax t nfr', 'Htpt p A jrj Dsrw jt jw w nTr dwAw nTry', 'Hnskt Hnn n k r jmw r w iw iwSS psS m xrw n p  pA  jw     Hww Swt   nwn n mn imn n', 'r wAt m ngmgm g d xnr n j Tms snaa ib'",
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
                    "and upper valleys to the parts of bread of the two guards to fetch nemtinakht', 'and they had the parts of the water of the herself', 'who attacks the parts of upper egypt of punt', 'do not vent your bread', 'second month of the season of growing day the morning', 'and the parts of the two sides kneeling to the parts of the justified had been taken from the justified', 'and to the road of a servant of the parts of the two fish canals",
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
