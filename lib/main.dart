import 'package:flutter/material.dart';
import 'package:newsapp/screens/home.dart';
import 'package:newsapp/screens/splach_screen.dart';

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
      routes: {
        HomeScreen.id:(context)=>HomeScreen(),
        SplashScreen.id:(context)=>SplashScreen(),
      },
      initialRoute: SplashScreen.id,
    );

  }
}
