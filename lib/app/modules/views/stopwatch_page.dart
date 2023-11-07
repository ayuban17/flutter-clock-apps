import 'dart:async';
import 'package:flutter/material.dart';

import '../../data/theme_data.dart';

class StopwatchPage extends StatefulWidget {
  @override
  _StopwatchPageState createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  bool _isRunning = false;
  int _milliseconds = 0;
  late Timer _timer;

  void _startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
        _milliseconds += 10;
      });
    });
  }

  void _stopTimer() {
    _timer.cancel();
  }

  void _resetTimer() {
    setState(() {
      _milliseconds = 0;
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String formattedTime = formatMilliseconds(_milliseconds);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            formattedTime,
            style: TextStyle(
                fontFamily: 'avenir',
                fontWeight: FontWeight.w300,
                color: CustomColors.primaryTextColor,
                fontSize: 50),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _isRunning
                    ? null
                    : () {
                        setState(() {
                          _isRunning = true;
                        });
                        _startTimer();
                      },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: Text('Start'),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: _isRunning
                    ? () {
                        setState(() {
                          _isRunning = false;
                        });
                        _stopTimer();
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  onPrimary: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: Text('Stop'),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  _resetTimer();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey,
                  onPrimary: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: Text('Reset'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

String formatMilliseconds(int milliseconds) {
  int minutes = (milliseconds ~/ 60000) % 60;
  int seconds = (milliseconds ~/ 1000) % 60;
  int centiseconds = (milliseconds ~/ 10) % 100;

  return '${twoDigits(minutes)}:${twoDigits(seconds)}:${twoDigits(centiseconds)}';
}

String twoDigits(int number) {
  return number.toString().padLeft(2, '0');
}
