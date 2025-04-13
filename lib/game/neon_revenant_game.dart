import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:neon_revenant/game/player_component.dart';

class NeonRevenantGame extends FlameGame {
  late JoystickComponent movementJoystick;
  late JoystickComponent shootingJoystick;
  late SpriteComponent background;

   late PlayerComponent player;
   Vector2 movementDirection = Vector2.zero();
   Vector2 shootingDirection = Vector2.zero();


  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // Fondo del nivel 1
    background = SpriteComponent()
      ..sprite = await loadSprite('images/level1.jpg') // ruta dentro de assets
      ..size = size; // ocupará todo el canvas
    add(background);

    // Joystick interno de Flame (invisible en UI)
    movementJoystick = JoystickComponent(
      knob: CircleComponent(radius: 30, paint: Paint()..color = Colors.transparent),
      background: CircleComponent(radius: 60, paint: Paint()..color = Colors.transparent),
    );
    add(movementJoystick);

    // Player
    player = PlayerComponent();
    add(player);

    camera.follow(player);  // Seguir al jugador
     // "bounds" en lugar de "worldBounds"

  }


  @override
  void update(double dt) {
    super.update(dt);
   // movementDirection = movementJoystick.direction;
    player.move(movementDirection, dt);
   
  }
}
