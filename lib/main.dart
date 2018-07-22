import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final randomWord = WordPair.random().asPascalCase;

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Lazy List"),
      ),
      body: Center(
        child: Text(
          randomWord,
        ),
      ),
    ));
  }
}
