import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flutter/material.dart' hide Route;

import '../main.dart';

class StartScreen extends Component with HasGameRef<CrowGame>, TapCallbacks {
  @override
  void onLoad() async {
    await super.onLoad();

    add(
      TextComponent(
        text: 'START',
        anchor: Anchor.center,
        position: gameRef.size / 2,
        textRenderer: TextPaint(
            style: const TextStyle(fontSize: 64, color: Colors.green)),
      ),
    );
  }

  @override
  bool containsLocalPoint(Vector2 point) => true;

  @override
  void onTapUp(TapUpEvent event) {
    gameRef.router.pushNamed('gameplay');
    super.onTapUp(event);
  }
}
