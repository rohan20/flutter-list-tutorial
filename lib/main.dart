import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:list_tutorial/RandomWords.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: RandomWords(),
    );
  }
}
