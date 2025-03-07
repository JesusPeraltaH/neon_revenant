import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:flutter/material.dart';

class Player extends SpriteComponent with CollisionCallbacks {
  Vector2 velocity = Vector2.zero();

  Player({required Sprite sprite})
    : super(sprite: sprite, size: Vector2(50, 50)) {
    anchor = Anchor.center;
    add(RectangleHitbox());
  }

  void updateMovement(Vector2 delta) {
    velocity = delta * 100;
  }

  void updateShooting(Vector2 delta) {
    if (delta.length > 0) {
      print("Disparando en dirección: $delta");
    }
  }

  @override
  void update(double dt) {
    position += velocity * dt;
  }
}
