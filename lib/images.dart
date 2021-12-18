import 'package:flutter/material.dart';
import 'package:flutter_application_1/image1.dart';
import 'package:flutter_application_1/image2.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_1/image3.dart';


class images extends StatefulWidget {
  images() : super();
  // const translatepage({Key? key}) : super(key: key);

  @override
  _imagesState createState() => _imagesState();
}

class _imagesState extends State<images> {
  // the text entered by the user
  String enteredText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(

        title: Text("HieroScan" , style:GoogleFonts.courgette( textStyle:TextStyle(color: Color(0xFFF8B232),),),),
        backgroundColor: const Color(0xFF000000),),
        body: Stack(
      children: <Widget>[
        Container(
          decoration:const BoxDecoration(
            image: DecorationImage(image: AssetImage("wall.jpg"), fit: BoxFit.cover,),

          ),
        ),
        
               Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
               
                Center(
                  
  child: InkWell(
    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) { return image1(); }),
                      )}, 
    child: Stack(
      children: <Widget>[
        Image.asset("test0.jpg",width: 200,
                                        height: 200,),
      ],
    ),
  ),
),
const SizedBox(height: 30),
Center(
  child: InkWell(
    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) { return image2(); }),
                      )} ,
    child: Stack(
      children: <Widget>[
        Image.asset("test1.jpg",width: 200,
                                        height: 200,),
      ],
    ),
  ),
),
const SizedBox(height: 30),

Center(
  child: InkWell(
    onTap:  () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) { return image3(); }),
                      )} ,
    child: Stack(
      children: <Widget>[
        Image.asset("test2.jpg",width: 200,
                                        height: 200,),
      ],
    ),
  ),
),

                  
                  ],),)
       ],
      


 
      
     ), );
  }
}