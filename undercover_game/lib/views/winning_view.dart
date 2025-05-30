import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:undercover_game/view_models/game_viewmodel.dart';
import 'package:undercover_game/views/home_view.dart';
import 'package:undercover_game/views/setup_view.dart';
import 'package:undercover_game/views/voting_view.dart';

class WinningView extends StatelessWidget {
  const WinningView({super.key});

  @override
  Widget build(BuildContext context) {
    bool citizensWon = !context.read<GameViewModel>().checkUndercoverWin();

    return Scaffold(
      appBar: AppBar(title: const Text('Winner')),
      body: Center(
        child: Column(
          children: [
            Text("CONGRATZ"),
            citizensWon ? Text("citizens") : Text("undercover"),
            Text("WON"),
            SizedBox(height: 10),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => SetupView()),
                    );
                  },
                  child: Text('Play again'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => HomeView()),
                    );
                  },
                  child: Text('Home'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
