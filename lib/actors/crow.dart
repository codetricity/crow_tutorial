import 'package:flame/components.dart';

import '../main.dart';

class Crow extends SpriteAnimationComponent with HasGameRef<CrowGame> {
  @override
  void onLoad() async {
    await super.onLoad();
    final crowAnimation = await gameRef.loadSpriteAnimation(
        'crow350x400.png',
        SpriteAnimationData.sequenced(
            amount: 12,
            amountPerRow: 4,
            stepTime: 0.1,
            textureSize: Vector2(350, 400)));
    animation = crowAnimation;
    position = gameRef.size / 2;
    anchor = Anchor.center;
    size = Vector2(gameRef.size.y * 350 / 400, gameRef.size.y) * .5;
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (y < gameRef.size.y && y > 0) {
      gameRef.gravity.y += .4;
      position += gameRef.gravity * dt;
    } else if (!gameRef.showingGameOverScreen) {
      gameRef.gameOver = true;
    }
  }
}
