import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';

class PlayerComponent extends SpriteComponent with HasGameRef {
  final double speed = 120;

  PlayerComponent()
      : super(
          size: Vector2.all(64),
          anchor: Anchor.center,
        );

  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite('player.png'); // coloca el sprite en assets
    position = gameRef.size / 2; // inicia en el centro
  }

  void move(Vector2 direction, double dt) {
    if (direction.length > 0) {
      position += direction.normalized() * speed * dt;
    }
  }
}
