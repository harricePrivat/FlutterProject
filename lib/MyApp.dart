import 'package:flutter/material.dart';
import 'ContentApp.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mon Test Application',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  final splashDuration = 3;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: splashDuration), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ContentApp()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/pdf.png'),
          fit: BoxFit.cover,
        ),
      ),
    ));
  }
}
