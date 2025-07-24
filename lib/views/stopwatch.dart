import 'dart:async';
// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Stopwatch extends StatefulWidget {
  const Stopwatch({super.key});

  @override
  State<Stopwatch> createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch> {
  int second = 0;
  late Timer timer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('StopWatch')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('$second Second', style: TextStyle(fontSize: 40)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    timer = Timer.periodic(Duration(seconds: 1), onTick);
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.green),
                    foregroundColor: WidgetStatePropertyAll(Colors.white),
                  ),
                  child: Text("Start"),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: null,
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.green),
                    foregroundColor: WidgetStatePropertyAll(Colors.white),
                  ),
                  child: Text("Stop"),
                  // style: ButtonStyle(backgroundColor:    Colors.green ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // void initState() {   //! when application start then timer automatically start
  //   super.initState();
  //   timer = Timer.periodic(Duration(seconds: 1), onTick);
  // }

  void onTick(Timer timer) {
    if (mounted) {
      setState(() {
        second++;
      });
    }
  }

  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
