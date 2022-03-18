import 'package:flutter/material.dart';
import 'package:note_futter/ui/HomeNote.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  final String title = 'Note';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(primaryColor: Colors.white),
      home: HomeNote(),
    );
  }
}
