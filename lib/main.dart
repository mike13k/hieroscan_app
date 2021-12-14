import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'translate.dart';
import 'improve.dart';
import 'package:google_fonts/google_fonts.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Init.instance.initialize(),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(home: Splash());
        } else {
          // Loading is done, return the app:
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(

              primarySwatch: Colors.blue,
            ),
            home: const MyHomePage(title: 'HieroScan'),
          );
        }
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title , style:GoogleFonts.courgette( textStyle:TextStyle(color: Color(0xFFF8B232),),),),
        backgroundColor: const Color(0xFF000000),
      ),
      body: Stack(
      children: <Widget>[
        Container(
          decoration:const BoxDecoration(
            image: DecorationImage(image: AssetImage("wall.jpg"), fit: BoxFit.cover,),
          ),
        ),
   
 Center(  
         child: Column(children: <Widget>[
             const SizedBox(height: 10),
       Container(
           width: 250,
           height: 300,
          decoration:const BoxDecoration(
            image: DecorationImage(image: AssetImage("dd.png"), fit: BoxFit.cover,),
          ),
        ),
                const SizedBox(height: 20),
                ButtonTheme(
                minWidth: 50.0,
                height: 80.0,
                // ignore: deprecated_member_use
                child:RaisedButton(
                onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) { return translatepage(); }),
                      )},
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
        'Translate Your Image',
        textAlign: TextAlign.center,
        style:GoogleFonts.courgette(fontSize: 18),
      ),
    ),
  ),
)
              ),
              const SizedBox(height: 30),
                ButtonTheme(
                minWidth: 50.0,
                height: 80.0,
                // ignore: deprecated_member_use
                child: RaisedButton(
                              onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) { return Improve(); }),
                      )},
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              padding: const EdgeInsets.all(0.0),
              child: Ink(
                decoration: const BoxDecoration(
                gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xFFF8B232),
                        Color(0xFFF8B232),


                      ],
                    ),
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
    ),
    child: Container(
      constraints: const BoxConstraints(minWidth: 30.0, minHeight: 80.0), // min sizes for Material buttons
      alignment: Alignment.center,
      width: 200,
      height: 80,
      child: Text(
        'Your Contribution',
        style:GoogleFonts.courgette(fontSize: 18),
        textAlign: TextAlign.center,
      
      ),
    ),
  ),
)
              ),]),

      ),
      ],
    )
          
    );
  }
}

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool lightMode =
        MediaQuery.of(context).platformBrightness == Brightness.light;
    return Scaffold(
      backgroundColor:
          lightMode ? const Color.fromRGBO(35, 31,32, 1) : const Color.fromRGBO(35, 31,32, 1),
      body: Center(
          child: lightMode
              ? Image.asset('assets/logo.jpg')
              : Image.asset('assets/logo.jpg')),
    );
  }
}

class Init {
  Init._();
  static final instance = Init._();

  Future initialize() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    await Future.delayed(const Duration(seconds: 3));
  }
}