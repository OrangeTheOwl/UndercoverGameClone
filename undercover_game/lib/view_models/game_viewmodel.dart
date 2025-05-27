import 'dart:math';
import 'package:flutter/material.dart';
import '../models/player_model.dart';
import '../utils/word_pairs.dart';


class GameViewModel extends ChangeNotifier {
  List<Player> players = [];
  int currentPlayerIndex = 0;
  String? eliminatedThisRound;
  Player? undercoverPlayer;
  void setPlayers(List<String> names) {
    players = names.map((name) => Player(name: name)).toList();
    assignRoles();
    notifyListeners();
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

  void eliminate(String name) {
    final target = players.firstWhere((p) => p.name == name);
    target.isEliminated = true;
    eliminatedThisRound = name;
    notifyListeners();
  }

  void resetElimination() {
    eliminatedThisRound = null;
    notifyListeners();
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