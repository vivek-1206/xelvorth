import 'package:flutter/material.dart';
import 'package:xelvorth/Features/login/view/LoginScreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({ super.key });

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
@override
  Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                Text(
                "XELVORTH",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 42, 26, 70)),
              ),
          ],
        ),
      ),
    );
  }
   @override
  void initState() {
    checkUserSession();
    super.initState();
  }

  checkUserSession() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
    
  }
}