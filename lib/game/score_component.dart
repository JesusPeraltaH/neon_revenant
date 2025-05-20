import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:neon_revenant/game/neon_revenant_game.dart';

class ScoreComponent extends TextComponent with HasGameRef<NeonRevenantGame> {
  ScoreComponent()
    : super(
        text: 'Score: 0',
        position: Vector2(10, 10),
        textRenderer: TextPaint(
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(color: Colors.black, offset: Offset(2, 2), blurRadius: 2),
            ],
          ),
        ),
      ) {
    priority = 100;
  }

  void updateScore(int newScore) {
    text = 'Score: $newScore';
  }
}
