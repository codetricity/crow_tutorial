import 'package:flame/game.dart';

import 'screens/game_over.dart';
import 'screens/game_play_screen.dart';

class CrowGame extends FlameGame {
  Vector2 gravity = Vector2(0, 30);
  late final RouterComponent router;
  bool displayingGameOver = false;
  bool gameOver = false;

  @override
  void onLoad() async {
    super.onLoad();
    add(
      router = RouterComponent(
        initialRoute: 'gameplay',
        routes: {
          'gameplay': Route(GamePlayScreen.new),
          'gameover': Route(GameOver.new),
        },
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (gameOver && !displayingGameOver) {
      print('gameover');
      router.pushNamed('gameover');
      displayingGameOver = true;
    }
  }
}
