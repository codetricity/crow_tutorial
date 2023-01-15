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
    ParallaxComponent mountainBackground = await loadParallaxComponent(
        [ParallaxImageData('background.png')],
        baseVelocity: Vector2(50, 0),
        velocityMultiplierDelta: Vector2(1.6, 1.0));
    add(mountainBackground);
  }
}
