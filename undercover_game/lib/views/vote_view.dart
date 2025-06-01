import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:undercover_game/view_models/game_viewmodel.dart';
import 'package:undercover_game/views/winning_view.dart';

class VoteView extends StatefulWidget {
  const VoteView({super.key});

  @override
  State<VoteView> createState() => VoteViewState();
}

class VoteViewState extends State<VoteView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final players = context.watch<GameViewModel>().activePlayers;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 44, 44, 139),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: SliverAppBar(
              playerIndex: currentIndex,
              playerCount: players.length,
            ),
            // Set this param so that it won't go off the screen when scrolling
            pinned: true,
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            delegate: SliverChildBuilderDelegate((
              BuildContext context,
              int index,
            ) {
              return Container(
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  onPressed: () {
                    currentIndex == players.length - 1
                        ? {
                            context.read<GameViewModel>().addVote(
                              players[index].name,
                            ),
                            setState(() {
                              currentIndex++;
                            }),
                            context.read<GameViewModel>().checkVotes() == "Tie"
                                ? {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Dialog(
                                          child: Material(
                                            color: const Color.fromARGB(
                                              255,
                                              83,
                                              88,
                                              91,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              15,
                                            ),
                                            child: Container(
                                              width: 250,
                                              height: 350,
                                              margin: EdgeInsets.all(20),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 150,
                                                    height: 150,
                                                    color: Colors.transparent,
                                                    child: Center(
                                                      child: Text(
                                                        "It is a tie. No one is eliminated.",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15,
                                                          fontFamily:
                                                              'Knewave-Regular',
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 40),

                                                  ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                      foregroundColor:
                                                          Colors.white,
                                                      backgroundColor:
                                                          Colors.blue,
                                                      minimumSize: Size(
                                                        150,
                                                        50,
                                                      ),
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              15.0,
                                                            ),
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text("Close"),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    context.read<GameViewModel>().resetVotes(),
                                    setState(() {
                                      currentIndex = 0;
                                    }),
                                  }
                                : {
                                    context
                                                .read<GameViewModel>()
                                                .checkCitizensWin() ||
                                            context
                                                .read<GameViewModel>()
                                                .checkUndercoverWin()
                                        ? Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => WinningView(),
                                            ),
                                          )
                                        : {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return Dialog(
                                                  child: Material(
                                                    color: const Color.fromARGB(
                                                      255,
                                                      83,
                                                      88,
                                                      91,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          15,
                                                        ),
                                                    child: Container(
                                                      width: 250,
                                                      height: 350,
                                                      margin: EdgeInsets.all(
                                                        20,
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            width: 150,
                                                            height: 150,
                                                            color: Colors
                                                                .transparent,
                                                            child: Center(
                                                              child: Text(
                                                                "A citizen was eliminated there is still no winner.",
                                                                style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 15,
                                                                  fontFamily:
                                                                      'Knewave-Regular',
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(height: 40),

                                                          ElevatedButton(
                                                            style: ElevatedButton.styleFrom(
                                                              foregroundColor:
                                                                  Colors.white,
                                                              backgroundColor:
                                                                  Colors.blue,
                                                              minimumSize: Size(
                                                                150,
                                                                50,
                                                              ),
                                                              shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                      15.0,
                                                                    ),
                                                              ),
                                                            ),
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                context,
                                                              );
                                                            },
                                                            child: Text(
                                                              "Close",
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                            context
                                                .read<GameViewModel>()
                                                .resetVotes(),
                                            setState(() {
                                              currentIndex = 0;
                                            }),
                                          },
                                  },
                          }
                        : {
                            context.read<GameViewModel>().addVote(
                              players[index].name,
                            ),
                            setState(() {
                              currentIndex++;
                            }),
                          };
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Material(
                        elevation: 15,
                        borderRadius: BorderRadius.circular(10),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              players[index].name[0],
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Knewave-Regular',
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        players[index].name,
                        style: TextStyle(
                          fontFamily: 'Knewave-Regular',
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }, childCount: players.length),
          ),
          // SliverFillRemaining(
          //   hasScrollBody: false,
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: [
          //       Padding(
          //         padding: EdgeInsets.all(20),
          //         child: currentIndex < players.length
          //             ? null
          //             : ElevatedButton(
          //                 style: ElevatedButton.styleFrom(
          //                   foregroundColor: Colors.white,
          //                   backgroundColor: const Color.fromARGB(
          //                     255,
          //                     83,
          //                     88,
          //                     91,
          //                   ),
          //                   minimumSize: Size(150, 50),
          //                   shape: RoundedRectangleBorder(
          //                     borderRadius: BorderRadius.circular(15.0),
          //                   ),
          //                 ),
          //                 onPressed: () {
          //                   Navigator.push(
          //                     context,
          //                     MaterialPageRoute(builder: (_) => VotingView()),
          //                   );
          //                 },
          //                 child: Text("Go Vote"),
          //               ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}

class AppBarCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height * 0.75);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(AppBarCliper oldClipper) => oldClipper != this;
}

class SliverAppBar extends SliverPersistentHeaderDelegate {
  final int playerIndex;
  final int playerCount;

  SliverAppBar({required this.playerIndex, required this.playerCount});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox(
      height: 280,
      child: ClipPath(
        clipper: AppBarCliper(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 180,
          color: Color.fromARGB(255, 29, 29, 104),
          child: Center(
            child: Text(
              'Player ${playerIndex + 1} Please make your vote!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Knewave-Regular',
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 180;

  @override
  double get minExtent => 180;

  // @override
  // bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
  //     oldDelegate.maxExtent != maxExtent || oldDelegate.minExtent != minExtent;

  @override
  bool shouldRebuild(covariant SliverAppBar oldDelegate) =>
      oldDelegate.playerIndex != playerIndex;
}
