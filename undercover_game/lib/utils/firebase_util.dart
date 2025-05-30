import 'package:firebase_database/firebase_database.dart';
import 'package:uuid/uuid.dart';
import 'package:undercover_game/models/player_model.dart';

class FirebaseUtil {
  final db = FirebaseDatabase.instance.ref();
  final uuid = const Uuid();

  Future<String> createGame(List<Player> players) async {
    String gameId = uuid.v4();

    final gameRef = db.child('games/$gameId');
    await gameRef.set({
      'players': players
          .map(
            (p) => {
              'name': p.name,
              'role': p.role,
              'word': p.word,
              'eliminated': p.isEliminated,
            },
          )
          .toList(),
      'status': 'waiting',
    });

    return gameId;
  }

  Future<void> joinGame(String gameId, Player player) async {
    final gameRef = db.child('games/$gameId/players');
    await gameRef.push().set({
      'name': player.name,
      'role': null,
      'word': null,
      'eliminated': false,
    });
  }

  Stream<DatabaseEvent> listenToGame(String gameId) {
    return db.child('games/$gameId').onValue;
  }

  Future<void> updateGameStatus(String gameId, String status) async {
    await db.child('games/$gameId/status').set(status);
  }
}
