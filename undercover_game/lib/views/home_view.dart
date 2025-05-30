import 'dart:math';

import 'package:flutter/material.dart';
import 'package:undercover_game/views/online_mode/join_view.dart';
import 'setup_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 44, 44, 139),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.rotate(
              angle: -pi / 7,
              child: Text(
                "UNDER",
                style: TextStyle(
                  fontFamily: 'Knewave-Regular',
                  fontSize: 50.0,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            Transform.rotate(
              angle: -pi / 7,
              child: Text(
                "COVER",
                style: TextStyle(
                  fontFamily: 'Knewave-Regular',
                  fontSize: 50.0,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            SizedBox(height: 50),
            Material(
              elevation: 50,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                // width: 200,
                // height: 200,
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 83, 88, 91),
                  //border: Border.all(color: Colors.black),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue,
                        iconColor: Colors.black,
                        minimumSize: Size(300, 150),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => JoinView()),
                        );
                      },
                      icon: Icon(Icons.wifi, size: 30),
                      label: Wrap(
                        direction: Axis.vertical,
                        children: [
                          Text("Online mode", style: TextStyle(fontSize: 20)),
                          Text(
                            "Play online with your friends or\nwith strangers.",
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue,
                        iconColor: Colors.black,
                        minimumSize: Size(300, 150),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => SetupView()),
                        );
                      },

                      icon: Icon(Icons.phone_android, size: 30),
                      label: Wrap(
                        direction: Axis.vertical,
                        children: [
                          Text("Offline mode", style: TextStyle(fontSize: 20)),
                          Text(
                            "Eveyone plays on the same\nphone. Players must be physically\ntogether.",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
