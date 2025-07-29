import 'dart:async';
import 'package:flutter/material.dart';

class Stopwatch extends StatefulWidget {
  const Stopwatch({super.key});

  @override
  State<Stopwatch> createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch> {
  int second = 0;
  int millisecond = 0; // ✅ NEW: added to track milliseconds
  late Timer timer;
  bool isTicking = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('StopWatch')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// ✅ Updated text to show both seconds and milliseconds
            Text(
              '$second.${millisecond.toString().padLeft(3, '0')} sec',
              style: TextStyle(fontSize: 40),
            ),
            SizedBox(height: 10),

            /// ✅ Buttons row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: isTicking ? null : _starttimer,
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.green),
                    foregroundColor: WidgetStatePropertyAll(Colors.white),
                    minimumSize: WidgetStatePropertyAll(Size(100, 100)),
                  ),
                  child: Text("Start", style: TextStyle(fontSize: 25)),
                ),
                SizedBox(width: 20),

                ElevatedButton(
                  onPressed: isTicking ? _stoptimer : null,
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.red),
                    foregroundColor: WidgetStatePropertyAll(Colors.white),
                    minimumSize: WidgetStatePropertyAll(Size(100, 100)),
                  ),
                  child: Text("Pause", style: TextStyle(fontSize: 25)),
                ),
                SizedBox(width: 20),

                /// ✅ Changed from Pause to Reset
                ElevatedButton(
                  onPressed: _resettimer,
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.blue),
                    foregroundColor: WidgetStatePropertyAll(Colors.white),
                    minimumSize: WidgetStatePropertyAll(Size(100, 100)),
                  ),
                  child: Text("Reset", style: TextStyle(fontSize: 25)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// ✅ Start the timer with 100ms interval for smooth millisecond updates
  void _starttimer() {
    timer = Timer.periodic(
      Duration(milliseconds: 100),
      onTick,
    ); // 100 ms = 0.1 sec
    setState(() {
      isTicking = true;
      // second = 0;
      // millisecond = 0;
    });
  }

  /// ✅ Stop the timer
  void _stoptimer() {
    timer.cancel();
    setState(() {
      isTicking = false;
    });
  }

  /// ✅ Reset both second and millisecond
  void _resettimer() {
    if (isTicking) timer.cancel();
    setState(() {
      isTicking = false;
      second = 0;
      millisecond = 0;
    });
  }

  /// ✅ Every 100ms, update the millisecond count, and roll over to next second
  void onTick(Timer timer) {
    if (!mounted) return;

    setState(() {
      millisecond += 100;
      if (millisecond >= 1000) {
        second++;
        millisecond = 0;
      }
    });
  }

  /// ✅ Cancel timer when widget is destroyed
  @override
  void dispose() {
    if (isTicking) timer.cancel();
    super.dispose();
  }
}
