import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:hackaton_tbd/game/speed_game.dart';
import 'package:hackaton_tbd/screen_selector.dart';

import 'game/joypad.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key, required this.onScreenChange}) : super(key: key);

  final void Function(ScreenSelector newSelected) onScreenChange;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final game = SpeedyGame();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
      body: Stack(
        children: [
          GameWidget(game: game),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Joypad(onDirectionChanged: game.onJoypadDirectionChanged),
              ),
            ),
          )
        ],
      ),
    );
  }
}
