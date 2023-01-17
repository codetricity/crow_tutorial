import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(GameWidget(game: CrowGame()));
}

class CrowGame extends FlameGame {
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
    add(SpriteComponent(
      position: size / 2,
      anchor: Anchor.center,
      sprite: await loadSprite('crow350x400.png', srcSize: Vector2(350, 400)),
    ));
  }
}
