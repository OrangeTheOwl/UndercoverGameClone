import 'dart:math';
import 'package:flutter/material.dart';
import '../models/player_model.dart';
import '../utils/word_pairs.dart';

class GameViewModel extends ChangeNotifier {
  List<Player> players = [];
  int currentPlayerIndex = 0;
  Player? undercoverPlayer;

  bool isNameTaken(String name) {
    return players.any((p) => p.name == name);
  }

  void createPlayers(int playerCount) {
    players.clear();
    for (int i = 0; i < playerCount; i++) {
      players.add(Player(name: ""));
    }
    assignRoles();
    notifyListeners();
  }

  void setPlayerName(int index, String name) {
    players[index].name = name;
    notifyListeners();
  }

  String getPlayerName(int index) {
    return players[index].name;
  }

  void assignRoles() {
    final random = Random();
    final wordPair = getRandomWordPair();
    int undercoverIndex = random.nextInt(players.length);

    for (int i = 0; i < players.length; i++) {
      if (i == undercoverIndex) {
        players[i].role = 'undercover';
        players[i].word = wordPair[1];
        undercoverPlayer = players[i];
      } else {
        players[i].role = 'citizen';
        players[i].word = wordPair[0];
      }
    }
  }

  void addVote(String name) {
    final target = players.firstWhere((p) => p.name == name);
    target.votes++;
    //checkVotes();
    // notifyListeners();
  }

  String checkVotes() {
    var mostVotes = players[0].votes;
    var mostVotesIndex = 0;

    for (var i = 0; i < players.length; i++) {
      // Checking for largest value in the list
      if (players[i].votes > mostVotes) {
        mostVotes = players[i].votes;
        mostVotesIndex = i;
      }
    }

    for (var i = 0; i < players.length; i++) {
      if (i == mostVotesIndex) {
        continue;
      } else if (players[i].votes == mostVotes) {
        return "Tie";
      }
    }

    players[mostVotesIndex].isEliminated = true;
    notifyListeners();
    return players[mostVotesIndex].name;
  }

  void resetVotes() {
    for (var i = 0; i < players.length; i++) {
      players[i].votes = 0;
    }
  }

  bool checkCitizensWin() {
    return players.any((p) => p.role == 'undercover' && p.isEliminated);
  }

  bool checkUndercoverWin() {
    final active = players.where((p) => !p.isEliminated).toList();
    return active.length == 2 && active.any((p) => p.role == 'undercover');
  }

  List<Player> get activePlayers =>
      players.where((p) => !p.isEliminated).toList();
}
