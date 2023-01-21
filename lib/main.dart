import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart' hide Route;

import 'actors/crow.dart';
import 'screens/game_over_screen.dart';
import 'screens/game_play_screen.dart';

void main() {
  runApp(GameWidget(game: CrowGame()));
}

class CrowGame extends FlameGame with HasTappableComponents {
  Vector2 gravity = Vector2(0, 30);
  late final RouterComponent router;
  bool gameOver = false;
  bool showingGameOverScreen = false;
  Crow crow = Crow();

  @override
  void onLoad() async {
    super.onLoad();
    add(
      router = RouterComponent(
        initialRoute: 'gameplay',
        routes: {
          'gameplay': Route(GamePlayScreen.new),
          'gameover': Route(GameOverScreen.new),
        },
      ),
    );
  }

  @override
  void update(double dt) {
    if (gameOver && !showingGameOverScreen) {
      router.pushNamed('gameover');
      showingGameOverScreen = true;
    }
    super.update(dt);
  }
}
