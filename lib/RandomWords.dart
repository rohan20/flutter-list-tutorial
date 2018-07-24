import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final List<WordPair> _allWordsList = [];
  final Set<WordPair> _savedWords = Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.list,
              color: Colors.white,
            ),
            onPressed: () => _pushSavedWords(),
          )
        ],
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

        if (index >= _allWordsList.length) {
          _allWordsList.addAll(generateWordPairs().take(50));
        }

        return _buildRow(_allWordsList[index]);
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

  _pushSavedWords() {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (context) {
        final Iterable<ListTile> wordTiles = _savedWords.map(
          (WordPair wordPair) {
            return ListTile(
              title: Text(
                wordPair.asPascalCase,
              ),
            );
          },
        );

        final List<Widget> wordPlusDividerTilesList = ListTile
            .divideTiles(
              context: context,
              tiles: wordTiles,
            )
            .toList();

        return Scaffold(
          appBar: AppBar(
            title: const Text("Saved Words"),
          ),
          body: wordPlusDividerTilesList.isEmpty
              ? Center(
                  child: Text(
                    "No saved words",
                    style: Theme.of(context).textTheme.headline,
                  ),
                )
              : ListView(
                  children: wordPlusDividerTilesList,
                ),
        );
      },
    ));
  }
}
