import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final List<WordPair> _suggestions = [];
  final Set<WordPair> _savedWords = Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lazy List"),
      ),
      body: _buildSuggestions(),
    );
  }

  _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) {
          return Divider();
        }

        final int index = i ~/ 2;

        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(50));
        }

        return _buildRow(_suggestions[index]);
      },
    );
  }

  _buildRow(WordPair wordPair) {
    final bool isWordAlreadySaved = _savedWords.contains(wordPair);

    return ListTile(
      title: Text(
        wordPair.asPascalCase,
      ),
      trailing: Icon(
        isWordAlreadySaved ? Icons.favorite : Icons.favorite_border,
        color: isWordAlreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (isWordAlreadySaved) {
            _savedWords.remove(wordPair);
          } else {
            _savedWords.add(wordPair);
          }
        });
      },
    );
  }
}
