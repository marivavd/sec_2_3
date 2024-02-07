import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Home',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 24,
            fontStyle: FontStyle.normal,
            fontFamily: 'Roboto',
          ),
        ),
      ),
    );
  }
}
