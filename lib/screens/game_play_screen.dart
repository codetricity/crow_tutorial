import 'package:flame/components.dart';
import 'package:flame/parallax.dart';

import '../airship.dart';
import '../crow_game.dart';

class GamePlayScreen extends Component with HasGameRef<CrowGame> {
  late SpriteAnimationComponent crow;

  @override
  void onLoad() async {
    await super.onLoad();
    ParallaxComponent mountainBackground = await gameRef.loadParallaxComponent([
      ParallaxImageData('sky.png'),
      ParallaxImageData('clouds_bg.png'),
      ParallaxImageData('glacial_mountains.png'),
      ParallaxImageData('clouds_mg_1.png'),
      ParallaxImageData('cloud_lonely.png'),
    ],
        baseVelocity: Vector2(10, 0),
        velocityMultiplierDelta: Vector2(1.6, 1.0));
    add(mountainBackground);

    final crowAnimation = await gameRef.loadSpriteAnimation(
        'crow350x400.png',
        SpriteAnimationData.sequenced(
            amount: 12,
            amountPerRow: 4,
            stepTime: 0.1,
            textureSize: Vector2(350, 400)));

    crow = SpriteAnimationComponent(
        animation: crowAnimation,
        position: gameRef.size / 2,
        anchor: Anchor.center,
        size: Vector2(gameRef.size.y * 350 / 400, gameRef.size.y) * .5);

    add(crow);
    add(AirShip());
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (crow.y < gameRef.size.y && crow.y > 0) {
      gameRef.gravity.y += .4;
      crow.position += gameRef.gravity * dt;
    } else if (!gameRef.displayingGameOver) {
      gameRef.gameOver = true;
      print('game over');
    }
  }

  // @override
  // bool containsLocalPoint(Vector2 point) => true;

  // @override
  // void onTapUp(TapUpEvent event) {
  //   gameRef.gravity.y -= 20;

  //   super.onTapUp(event);
  // }
}
