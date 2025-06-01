import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:undercover_game/view_models/game_viewmodel.dart';
import 'package:undercover_game/views/setup_view.dart';

class WinningView extends StatelessWidget {
  const WinningView({super.key});

  @override
  Widget build(BuildContext context) {
    bool citizensWon = !context.read<GameViewModel>().checkUndercoverWin();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 44, 44, 139),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(50),
              child: Text(
                "CONGRATULATIONS",
                style: TextStyle(
                  fontFamily: 'Knewave-Regular',
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
            citizensWon
                ? Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "The Civilians ",
                          style: TextStyle(
                            fontFamily: 'Knewave-Regular',
                            fontSize: 50,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Win!!!",
                          style: TextStyle(
                            fontFamily: 'Knewave-Regular',
                            fontSize: 50,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "The Undercover ",
                          style: TextStyle(
                            fontFamily: 'Knewave-Regular',
                            fontSize: 50,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Win!!!",
                          style: TextStyle(
                            fontFamily: 'Knewave-Regular',
                            fontSize: 50,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
            SizedBox(height: 15),
            SizedBox(height: 10),
            citizensWon
                ? SizedBox(
                    width: 350,
                    height: 350,
                    child: Image.asset(
                      'assets/trophy.png',
                      fit: BoxFit.contain,
                    ),
                  )
                : SizedBox(
                    width: 350,
                    height: 350,
                    child: Image.asset(
                      'assets/undercover.png',
                      fit: BoxFit.contain,
                    ),
                  ),
            SizedBox(height: 25),
            Padding(
              padding: EdgeInsets.all(20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromARGB(255, 83, 88, 91),
                  minimumSize: Size(150, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => SetupView()),
                  );
                },
                child: const Text('Play Again'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
