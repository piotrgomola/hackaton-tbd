import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hackaton_tbd/quiz_screen.dart';
import 'package:hackaton_tbd/startScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool showQuiz = false;

  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () => setState(() {
        showQuiz = true;
      }),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Navigator(
        pages: [
          const MaterialPage(
            key: ValueKey('startScreen'),
            child: StartScreen(),
          ),
          if (showQuiz)
            const MaterialPage(
              key: ValueKey('quizScreen'),
              child: QuizScreen(),
            ),
        ],
        onPopPage: (route, result) => route.didPop(result),
      ),
    );
  }
}
