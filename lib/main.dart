import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:mems_app/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(     
        primarySwatch: Colors.blue,
      ),
      home: Stack(
        children: [
          AnimatedSplashScreen(
            splash:Image.network('https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/77546e83-4a68-4264-99f7-6bdfc8f0eaf8/dci6r36-c132f132-8320-42be-9565-6741c6a05972.png/v1/fill/w_809,h_988,strp/paper_mario__jumping__remake_by_fawfulthegreat64_dci6r36-pre.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTI1MCIsInBhdGgiOiJcL2ZcLzc3NTQ2ZTgzLTRhNjgtNDI2NC05OWY3LTZiZGZjOGYwZWFmOFwvZGNpNnIzNi1jMTMyZjEzMi04MzIwLTQyYmUtOTU2NS02NzQxYzZhMDU5NzIucG5nIiwid2lkdGgiOiI8PTEwMjQifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.Pp9z9IYg76GI0yKMT-vYPoHUOFwYKsiI08ye_IZpPJM'),
            duration: 3000,
            splashIconSize: 200.0,
            splashTransition: SplashTransition.fadeTransition,
            nextScreen: MainScreen(),
            ),
         Positioned(
          bottom: 160,
          left: 160,
          child: Text('Memes App',
         style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,
         ),)
         )
        ],
      ),  
    );
  }
}

