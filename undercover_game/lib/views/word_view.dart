import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:undercover_game/views/description_view.dart';
import 'package:undercover_game/views/home_view.dart';
import 'package:undercover_game/view_models/game_viewmodel.dart';

class WordView extends StatefulWidget {
  const WordView({super.key});

  @override
  State<WordView> createState() => WordViewState();
}

class WordViewState extends State<WordView> {
  int currentIndex = 0;
  bool isWordVisible = false;

  @override
  Widget build(BuildContext context) {
    final players = context.read<GameViewModel>().players;
    final player = players[currentIndex];

    return Scaffold(
      appBar: AppBar(title: Text('Player ${currentIndex + 1}')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: ${player.name}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            isWordVisible
                ? Text(
                    'Your word: ${player.word}',
                    style: TextStyle(fontSize: 20),
                  )
                : Text('Your word is hidden', style: TextStyle(fontSize: 20)),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                if (!isWordVisible) {
                  setState(() => isWordVisible = true);
                }
              },
              child: Text("Show word"),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                if (!isWordVisible) {
                } else {
                  if (currentIndex < players.length - 1) {
                    setState(() => currentIndex++);
                    setState(() => isWordVisible = false);
                  } else {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => DescriptionView()),
                    );
                  }
                }
              },
              child: Text(
                currentIndex < players.length - 1
                    ? 'Next Player'
                    : 'Start Game',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
