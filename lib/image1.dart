import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class image1 extends StatefulWidget {
  image1() : super();
  // const translatepage({Key? key}) : super(key: key);

  @override
  _image1State createState() => _image1State();
}

class _image1State extends State<image1> {
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
    onTap: (){ } ,
    child: Stack(
      children: <Widget>[
        Image.asset("classification0.png",width: 400,
                                        height: 400,),
      ],
    ),
  ),

),
SizedBox(height: 30,),
Center(child: Text("and the parts of the two lands of bread to the water', 'and he will high steward rensi son of bread', 'you turn them to the time of nun', 'King of Upper Egypt in Buto", style:GoogleFonts.courgette( textStyle:TextStyle(color: Color(0xFFF8B232),),fontSize: 20),),)




                  
                  ],),)
       ],
      


 
      
     ), );
  }
}