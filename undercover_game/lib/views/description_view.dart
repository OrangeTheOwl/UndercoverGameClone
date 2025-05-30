import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:undercover_game/view_models/game_viewmodel.dart';
import 'package:undercover_game/views/home_view.dart';
import 'package:undercover_game/views/voting_view.dart';

class DescriptionView extends StatelessWidget {
  const DescriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Describe Your Word')),
      body: Center(child: Text("Each player should now describe their word")),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => VotingView()),
          );
        },
        label: const Text('Proceed to Voting'),
        icon: const Icon(Icons.how_to_vote),
      ),
    );
  }
}
