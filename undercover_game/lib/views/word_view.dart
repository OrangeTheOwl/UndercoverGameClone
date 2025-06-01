import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:undercover_game/view_models/game_viewmodel.dart';
import 'package:undercover_game/views/vote_view.dart';

class WordView extends StatefulWidget {
  const WordView({super.key});

  @override
  State<WordView> createState() => WordViewState();
}

class WordViewState extends State<WordView> {
  final myController = TextEditingController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final players = context.watch<GameViewModel>().players;

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
                    players[index].name == ""
                        ? showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                child: Material(
                                  color: const Color.fromARGB(255, 83, 88, 91),
                                  borderRadius: BorderRadius.circular(15),
                                  child: Container(
                                    width: 250,
                                    height: 350,
                                    margin: EdgeInsets.all(20),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(Icons.person, size: 100),
                                        ),
                                        SizedBox(height: 40),
                                        TextField(
                                          textAlign: TextAlign.left,
                                          controller: myController,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.white,
                                            border: const UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.white,
                                              ),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                            ),
                                            labelText: 'Enter name',
                                            counterStyle: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          maxLength: 10,
                                        ),
                                        SizedBox(height: 30),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            foregroundColor: Colors.white,
                                            backgroundColor: Colors.blue,
                                            minimumSize: Size(150, 50),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                          ),
                                          onPressed: () {
                                            if (myController.text != "") {
                                              context
                                                      .read<GameViewModel>()
                                                      .isNameTaken(
                                                        myController.text,
                                                      )
                                                  ? ScaffoldMessenger.of(
                                                      context,
                                                    ).showSnackBar(
                                                      SnackBar(
                                                        content: Center(
                                                          child: Text(
                                                            "Name is already taken!",
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  : {
                                                      setState(
                                                        () =>
                                                            players[index]
                                                                    .name =
                                                                myController
                                                                    .text,
                                                      ),

                                                      myController.text = "",

                                                      Navigator.pop(context),

                                                      showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return Dialog(
                                                            child: Material(
                                                              color:
                                                                  const Color.fromARGB(
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
                                                                margin:
                                                                    EdgeInsets.all(
                                                                      20,
                                                                    ),
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Material(
                                                                      color: Colors
                                                                          .white,
                                                                      elevation:
                                                                          50,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                            20,
                                                                          ),
                                                                      child: Container(
                                                                        width:
                                                                            150,
                                                                        height:
                                                                            150,
                                                                        color: Colors
                                                                            .transparent,
                                                                        child: Center(
                                                                          child: Text(
                                                                            "${players[index].word}",
                                                                            style: TextStyle(
                                                                              fontSize: 40,
                                                                              fontFamily: 'Knewave-Regular',
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          70,
                                                                    ),

                                                                    ElevatedButton(
                                                                      style: ElevatedButton.styleFrom(
                                                                        foregroundColor:
                                                                            Colors.white,
                                                                        backgroundColor:
                                                                            Colors.blue,
                                                                        minimumSize:
                                                                            Size(
                                                                              150,
                                                                              50,
                                                                            ),
                                                                        shape: RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius.circular(
                                                                            15.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      onPressed: () {
                                                                        setState(
                                                                          () {
                                                                            currentIndex++;
                                                                          },
                                                                        );

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
                                                    };
                                            }
                                          },
                                          child: Text("Get your secret word"),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        : null;
                  },
                  child: players[index].name == ""
                      ? Center(
                          child: Text(
                            "Unclaimed card",
                            style: TextStyle(
                              fontFamily: 'Knewave-Regular',
                              fontSize: 10,
                              color: Colors.black,
                            ),
                          ),
                        )
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Material(
                                elevation: 15,
                                borderRadius: BorderRadius.circular(20),
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
                              Center(
                                child: Text(
                                  players[index].name,
                                  style: TextStyle(
                                    fontFamily: 'Knewave-Regular',
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                ),
              );
            }, childCount: players.length),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: currentIndex < players.length
                      ? null
                      : ElevatedButton(
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
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (_) => VoteView()),
                            );
                          },
                          child: Text("Go Vote"),
                        ),
                ),
              ],
            ),
          ),
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
            child: playerIndex < playerCount
                ? Text(
                    'Player ${playerIndex + 1} choose your card!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Knewave-Regular',
                    ),
                  )
                : Text(
                    "Players should now describe their words in order.\nProceed to the voting screen when done.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
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
