import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Colors.orange,
          Colors.pink,
        ],
      )),
      child: const Center(
          child: Text(
        'START',
        style: TextStyle(
          color: Colors.white,
          decoration: TextDecoration.none,
          fontSize: 60,
        ),
      )),
    );
  }
}
