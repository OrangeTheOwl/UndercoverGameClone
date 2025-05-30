import 'package:flutter/material.dart';
import 'package:undercover_game/utils/firebase_util.dart';
import 'package:undercover_game/view_models/game_viewmodel.dart';
import 'views/home_view.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    ChangeNotifierProvider(
      create: (_) => GameViewModel(),
      child: const UndercoverGame(),
    ),
  );
}

class UndercoverGame extends StatelessWidget {
  const UndercoverGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Undercover Game test', home: const HomeView());
  }
}
