import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:neon_revenant/game/neon_revenant_game.dart';

class LevelText extends TextComponent with HasGameRef<NeonRevenantGame> {
  double _opacity = 0.0;
  bool _isFadingIn = true;
  bool _isFadingOut = false;
  final double fadeSpeed = 2.0; // Aumentada la velocidad de fade

  LevelText()
    : super(
        text: 'LEVEL 1',
        textRenderer: TextPaint(
          style: const TextStyle(
            color: Colors.white,
            fontSize: 96, // Aumentado aún más el tamaño
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(color: Colors.black, offset: Offset(3, 3), blurRadius: 5),
            ],
          ),
        ),
        anchor: Anchor.center,
      );

  @override
  void onMount() {
    super.onMount();
    // Centrar el texto en el mapa
    position = Vector2(
      gameRef.mapComponent.size.x / 2,
      gameRef.mapComponent.size.y / 2,
    );
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (_isFadingIn) {
      _opacity += fadeSpeed * dt;
      if (_opacity >= 1.0) {
        _opacity = 1.0;
        _isFadingIn = false;
        // Esperar 2 segundos antes de empezar a desvanecer
        Future.delayed(const Duration(seconds: 2), () {
          _isFadingOut = true;
        });
      }
    } else if (_isFadingOut) {
      _opacity -= fadeSpeed * dt;
      if (_opacity <= 0.0) {
        _opacity = 0.0;
        removeFromParent();
      }
    }

    // Actualizar el color del texto con la opacidad actual
    textRenderer = TextPaint(
      style: const TextStyle(
        color: Colors.white,
        fontSize: 96,
        fontWeight: FontWeight.bold,
        shadows: [
          Shadow(color: Colors.black, offset: Offset(3, 3), blurRadius: 5),
        ],
      ).copyWith(color: Colors.white.withOpacity(_opacity)),
    );
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }
}
