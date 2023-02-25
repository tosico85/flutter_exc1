import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isRunning = false;
  int pomodoros = 0;
  int totalSeconds = 1500;
  late Timer timer;

  onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        isRunning = false;
        pomodoros++;
        totalSeconds = 1500;
      });
      timer.cancel();
    } else {
      setState(() {
        if (totalSeconds > 0) {
          totalSeconds -= 1;
        }
      });
    }
  }

  void onPressedStart() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );

    setState(() {
      isRunning = true;
    });
  }

  void onPressedStop() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void onPressedRestart() {
    setState(() {
      totalSeconds = 1500;
    });
  }

  String formatSec(int seconds) {
    Duration duration = Duration(seconds: seconds);
    return duration.toString().split(".")[0].substring(2, 7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                formatSec(totalSeconds),
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 70,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Center(
              child: IconButton(
                onPressed: isRunning ? onPressedStop : onPressedStart,
                icon: Icon(
                  isRunning
                      ? Icons.pause_circle_outline
                      : Icons.play_circle_outline,
                ),
                iconSize: 98,
                color: Theme.of(context).cardColor,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Center(
              child: IconButton(
                onPressed: onPressedRestart,
                icon: const Icon(
                  Icons.restart_alt_rounded,
                ),
                iconSize: 50,
                color: Theme.of(context).cardColor.withOpacity(
                      totalSeconds == 1500 ? 0 : 1,
                    ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Pomodoros",
                    style: TextStyle(
                        color: Theme.of(context).textTheme.displayLarge?.color,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "$pomodoros",
                    style: TextStyle(
                      color: Theme.of(context).textTheme.displayLarge?.color,
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
