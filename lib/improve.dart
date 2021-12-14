import 'package:flutter/material.dart';
import 'package:flutter_application_1/add.dart';
import 'package:google_fonts/google_fonts.dart';


class Improve extends StatefulWidget {
  Improve() : super();
  // const translatepage({Key? key}) : super(key: key);

  @override
  _ImproveState createState() => _ImproveState();
}

class _ImproveState extends State<Improve> {
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
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                  TextField(

                    style: TextStyle(color: Colors.white),
                     cursorColor: Color(0xFFF8B232),
                      decoration: InputDecoration(    
                         prefixIcon: const Icon(
                            Icons.person,
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
                    hintText: "Egyptologist Email",
                    hintStyle: TextStyle( color: Colors.grey),
                  )),
                  SizedBox(height: 15),
                  TextField(
                      obscureText: true,

                    style: TextStyle(color: Colors.white),
                     cursorColor: Color(0xFFF8B232),
                      decoration: InputDecoration(    
                         prefixIcon: const Icon(
                            Icons.lock,
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
                    hintText: "Password",
                    hintStyle: TextStyle( color: Colors.grey,),
                  )),
                  SizedBox(height: 30),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
          padding: const EdgeInsets.all(30),
          textColor: Colors.black,
          color: Color(0xFFF8B232),
          onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) { return add(); }),
                      )},
          child: Text('Sign In',style:GoogleFonts.courgette(fontSize: 18),),
        ),
                  ],),)
       ],
      


 
      
     ), );
  }
}