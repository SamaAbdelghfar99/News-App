import 'package:flutter/material.dart';
import 'package:newsapp/screens/home.dart';

class SplashScreen extends StatefulWidget {
  static const String id='splash';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
    }
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(image: AssetImage('assets/images/pattern.png'))
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
              const Text('Developed by Sama Abdelghfar',
                style: TextStyle(color: Color(0xff39A552)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
