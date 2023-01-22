import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/parallax.dart';

import '../actors/airship.dart';
import '../main.dart';

class GamePlayScreen extends Component with HasGameRef<CrowGame>, TapCallbacks {
  Timer interval = Timer(6, repeat: true);

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

    add(gameRef.crow);

    interval.onTick = () => add(AirShip());
  }

  @override
  void update(double dt) {
    interval.update(dt);
    super.update(dt);
  }

  @override
  bool containsLocalPoint(Vector2 point) => true;

  @override
  void onTapUp(TapUpEvent event) {
    gameRef.gravity.y -= 20;

    super.onTapUp(event);
  }
}
