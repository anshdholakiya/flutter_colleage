import 'package:flutter/material.dart';
import 'package:flutter_colleage/arzoo%20sir/notes_app.dart';
import 'nikunj sir/calculator.dart';
import 'nikunj sir/stopwatch.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),

      //! arzoo sir
      // home: NotesApp(),

      //! nikunj sir componetns
      home: Stopwatch(),
      // home: Calculator(),
    );
  }
}
