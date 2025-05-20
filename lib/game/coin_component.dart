import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:neon_revenant/game/neon_revenant_game.dart';
import 'package:neon_revenant/game/player_component.dart';

class CoinComponent extends SpriteComponent
    with CollisionCallbacks, HasGameRef<NeonRevenantGame> {
  CoinComponent({required Vector2 position})
    : super(position: position, size: Vector2(32, 32));

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // Añadir un hitbox circular para la moneda
    add(
      CircleHitbox(
        radius: 16,
        anchor: Anchor.center,
        position: Vector2(16, 16),
      ),
    );

    // Cargar el sprite de la moneda
    sprite = await gameRef.loadSprite('coin.png');
  }

  @override
  void update(double dt) {
    super.update(dt);
    // Añadir un pequeño movimiento flotante
    //position.y += sin(gameRef.time * 2) * 0.5;
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    if (other is PlayerComponent) {
      // Añadir puntos al score
      gameRef.addScore(10);

      // Eliminar la moneda
      removeFromParent();
    }
    super.onCollisionStart(intersectionPoints, other);
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    if (other is PlayerComponent) {
      print('Fin de colisión con moneda'); // Debug print
    }
    super.onCollisionEnd(other);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    // Debug: dibujar un borde alrededor de la moneda
    final paint =
        Paint()
          ..color = Colors.red
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.0;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.x, size.y), paint);
  }
}
