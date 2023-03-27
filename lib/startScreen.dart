import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hackaton_tbd/screen_selector.dart';
import 'package:rive/rive.dart' as Rive;

class StartScreen extends StatefulWidget {
  const StartScreen({
    Key? key,
    required this.onScreenChange,
  }) : super(key: key);

  final void Function(ScreenSelector newSelected) onScreenChange;

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  late Rive.RiveAnimationController _controller;
  var isLoading = false;

  @override
  void initState() {
    _controller = Rive.SimpleAnimation('loading-1');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: _onScreenTap,
        child: Container(
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
          child: Stack(children: [
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
            if (isLoading)
              Center(
                child: SizedBox(
                  height: 400,
                  width: 300,
                  child: Rive.RiveAnimation.asset(
                    'assets/loader.riv',
                    fit: BoxFit.cover,
                    controllers: [_controller],
                  ),
                ),
              ),
          ]),
        ),
      ),
    );
  }

  void _onScreenTap() {
    setState(() => isLoading = true);
    Timer(
      const Duration(seconds: 3),
      () {
        setState(() => isLoading = false);
        widget.onScreenChange.call(ScreenSelector.inputName);
      },
    );
  }
}
