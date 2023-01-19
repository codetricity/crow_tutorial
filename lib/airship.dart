import 'package:flame/components.dart';

import 'main.dart';

class AirShip extends SpriteComponent with HasGameRef<CrowGame> {
  @override
  void onLoad() async {
    await super.onLoad();
    sprite = await gameRef.loadSprite('airship.png');
    size = Vector2(gameRef.size.y * 800 / 469, gameRef.size.y) * .15;
    flipHorizontallyAroundCenter();
    position = Vector2(gameRef.size.x * .95, 30);
  }

  @override
  void update(double dt) {
    super.update(dt);
    x = x - 100 * dt;
  }
}
