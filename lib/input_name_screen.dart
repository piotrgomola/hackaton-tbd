import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:hackaton_tbd/screen_selector.dart';

class InputNameScreen extends StatefulWidget {
  const InputNameScreen({Key? key, required this.onScreenChange}) : super(key: key);

  final void Function(ScreenSelector newSelected) onScreenChange;

  @override
  State<InputNameScreen> createState() => _InputNameScreenState();
}

class _InputNameScreenState extends State<InputNameScreen> {
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Container(
                  decoration: BoxDecoration(
                    border: const GradientBoxBorder(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.pink,
                          Colors.orange,
                        ],
                      ),
                      width: 4,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 2),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(Icons.arrow_circle_left_outlined),
                            color: Colors.pink,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: Center(
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.black54, fontSize: 40),
                            autocorrect: false,
                            maxLines: 1,
                            cursorColor: Colors.pink,
                            onChanged: (value) => name = value,
                            textCapitalization: TextCapitalization.sentences,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'YOUR NAME',
                              hintStyle: TextStyle(color: Colors.grey.withOpacity(0.4), fontSize: 30),
                              focusColor: Colors.orange,
                              icon: const Icon(
                                Icons.account_circle_outlined,
                                size: 50,
                              ),
                              iconColor: Colors.orange,
                              suffixIcon: IconButton(
                                icon: const Icon(
                                  Icons.arrow_circle_right_outlined,
                                  size: 50,
                                  color: Colors.orange,
                                ),
                                onPressed: () => widget.onScreenChange.call(ScreenSelector.game),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
