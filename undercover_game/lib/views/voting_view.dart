import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:undercover_game/views/description_view.dart';
import 'package:undercover_game/views/home_view.dart';
import 'package:undercover_game/view_models/game_viewmodel.dart';
import 'package:undercover_game/views/winning_view.dart';

class VotingView extends StatefulWidget {
  const VotingView({super.key});

  @override
  State<VotingView> createState() => VotingViewState();
}

class VotingViewState extends State<VotingView> {
  int currentIndex = 0;
  bool isWordVisible = false;

  @override
  Widget build(BuildContext context) {
    final players = context.watch<GameViewModel>().activePlayers;


    return Scaffold(
      appBar: AppBar(title: Text("voting screen")),
      body: Column(
        children: [
          Expanded(child: ListView.builder(
            itemCount: players.length,
            itemBuilder: (context, index) => Center(
              child: Padding(padding: const EdgeInsets.all(20.0),
                child: TextButton(onPressed: (){
                  context.read<GameViewModel>().eliminate(players.elementAt(index).name);
                  if(context.read<GameViewModel>().checkCitizensWin() || context.read<GameViewModel>().checkUndercoverWin()){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => WinningView()),
                    );
                  }
                  else{
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => DescriptionView()),
                    );
                  }
                }, child: Text('Player ${players.elementAt(index).name}'))
              )
            )
          
          ))
        ],
      ),
    );
  }
}
