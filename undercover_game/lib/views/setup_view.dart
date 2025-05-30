import 'package:flutter/material.dart';
import 'package:undercover_game/view_models/game_viewmodel.dart';
import 'home_view.dart';
import 'package:provider/provider.dart';
import 'word_view.dart';

class SetupView extends StatefulWidget {
  const SetupView({super.key});

  @override
  _SetupViewState createState() => _SetupViewState();
}

class _SetupViewState extends State<SetupView> {
  int playerCount = 3;
  List<TextEditingController> controllers = [];

  @override
  Widget build(BuildContext context) {
    controllers = List.generate(playerCount, (i) => TextEditingController());

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 44, 44, 139),
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Players: $playerCount",
                style: TextStyle(
                  fontFamily: 'Knewave-Regular',
                  fontSize: 50.0,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              Slider(
                value: playerCount.toDouble(),
                onChanged: (newPlayerCount) {
                  setState(() => playerCount = newPlayerCount.toInt());
                },
                min: 3,
                max: 12,
                divisions: 9,
                activeColor: Colors.amber,
              ),
              Material(
                elevation: 50,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: 200,
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue,
                    //border: Border.all(color: Colors.black),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${playerCount - 1} Civilians",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "1 Undercover",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: const Color.fromARGB(
                            255,
                            83,
                            88,
                            91,
                          ),
                          minimumSize: Size(150, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        onPressed: () {
                          context.read<GameViewModel>().createPlayers(
                            playerCount,
                          );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => WordView()),
                          );
                        },
                        child: const Text('Start'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
