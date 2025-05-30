import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:undercover_game/utils/firebase_util.dart';
import 'package:undercover_game/views/description_view.dart';
import 'package:undercover_game/views/home_view.dart';
import 'package:undercover_game/view_models/game_viewmodel.dart';
import 'package:undercover_game/views/winning_view.dart';

class JoinView extends StatefulWidget {
  const JoinView({super.key});

  @override
  State<JoinView> createState() => JoinViewState();
}

class JoinViewState extends State<JoinView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Available games:")),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                FirebaseUtil test = FirebaseUtil();
                List<String> names = ["a", "b", "c"];
                context.read<GameViewModel>().setPlayers(names);

                test.createGame(context.read<GameViewModel>().activePlayers);
              },
              child: Text("test database"),
            ),
          ],
        ),
      ),
    );
  }
}
