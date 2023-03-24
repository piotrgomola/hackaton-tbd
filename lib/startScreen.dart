import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart' as Rive;

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  late Rive.RiveAnimationController _controller;

  @override
  void initState() {
    _controller = Rive.SimpleAnimation('loading-1');
    Timer(Duration(seconds: 3), () {
      print("Yeah, this line is printed after 3 seconds");
    });
    super.initState();
  }

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
        ),
      ),
      child: Stack(
        children: [
          const Center(
            child: Text(
              'START',
              style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.none,
                fontSize: 60,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: SizedBox(
                height: 200,
                width: 200,
                child: Rive.RiveAnimation.asset(
                  'assets/loader.riv',
                  fit: BoxFit.cover,
                  controllers: [_controller],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
