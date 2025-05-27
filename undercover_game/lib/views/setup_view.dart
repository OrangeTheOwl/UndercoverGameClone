import 'package:flutter/material.dart';
import 'package:undercover_game/view_models/game_viewmodel.dart';
import 'home_view.dart';
import 'package:provider/provider.dart';
import 'word_view.dart';

class SetupView extends StatefulWidget{
  const SetupView({super.key});

  @override
  _SetupViewState createState() => _SetupViewState();
}

class _SetupViewState extends State<SetupView>{
  int playerCount = 3;
  List<TextEditingController> controllers = [];


  @override
  Widget build(BuildContext context){
    controllers = List.generate(playerCount, (i) => TextEditingController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Offline Player Setup test"),
      ),
      body: Column(
        children: [
          DropdownButton<int>(
            value: playerCount,
            onChanged: (val) {
              setState(() => playerCount = val!);
            },
            items: List.generate(10, (i) => i + 3)
            .map((e) => DropdownMenuItem(value: e, child: Text('$e Players')))
            .toList(),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: playerCount,
              itemBuilder: (_, i) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: controllers[i],
                  decoration: InputDecoration(labelText: 'Player ${i + 1} Name'),
                ),
              ),
            ) 
          ),
          ElevatedButton(
            onPressed: () {
              final names = controllers.map((c) => c.text).toList();
              context.read<GameViewModel>().setPlayers(names);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => WordView()),
              );
            },
            child: const Text('See first players word'),
          )
        ],
      ),
    );
  }

}