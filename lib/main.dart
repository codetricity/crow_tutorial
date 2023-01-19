import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(GameWidget(game: CrowGame()));
}

class CrowGame extends FlameGame {
  late SpriteAnimationComponent crow;

  @override
  void onLoad() async {
    super.onLoad();
    ParallaxComponent mountainBackground = await loadParallaxComponent([
      ParallaxImageData('sky.png'),
      ParallaxImageData('clouds_bg.png'),
      ParallaxImageData('glacial_mountains.png'),
      ParallaxImageData('clouds_mg_1.png'),
      ParallaxImageData('cloud_lonely.png'),
    ],
        baseVelocity: Vector2(10, 0),
        velocityMultiplierDelta: Vector2(1.6, 1.0));
    add(mountainBackground);

    final crowAnimation = await loadSpriteAnimation(
        'crow350x400.png',
        SpriteAnimationData.sequenced(
            amount: 12,
            amountPerRow: 4,
            stepTime: 0.1,
            textureSize: Vector2(350, 400)));

    crow = SpriteAnimationComponent(
        animation: crowAnimation,
        position: size / 2,
        anchor: Anchor.center,
        size: Vector2(size.y * 350 / 400, size.y));

    add(crow);
  }
}
