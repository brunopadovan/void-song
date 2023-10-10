import 'dart:async';
import 'package:flutter/material.dart';
import 'package:void_song/Player.dart';
import 'Button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //snap variables
  double snapX = 0;
  double snapY = 1;

  void Snap_Center() {
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
       snapY -= 0.1;
        // For example, you can use snapX += 0.1; to update snapX.
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 6,
          child: Container(
            color: Colors.pink[200],
            child: Center(
              child: Stack(
                children: [
                  MyPlayer(),
                  Container(
                    alignment: Alignment(snapX, snapY),
                    child: Container(
                      width: 30,
                      height: 30,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.grey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyButton(
                  icon: Icons.circle,
                ),
                MyButton(
                  icon: Icons.circle,
                  function: Snap_Center,
                ),
                MyButton(
                  icon: Icons.circle,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
