import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:neon_revenant/game/player.dart';
import 'package:neon_revenant/images.dart';

class NeonRevenantGame extends FlameGame with HasCollisionDetection {
  late Player player;
  late JoystickComponent moveJoystick;
  late JoystickComponent shootJoystick;
  late SpriteComponent background;

  @override
  Future<void> onLoad() async {
    await images.loadAll([Images.background, Images.player, Images.bullet]);

    // 🔹 Asegurar que el sprite se carga correctamente
    final bgSprite = await loadSprite(Images.background);
    background = SpriteComponent(sprite: bgSprite, size: size);
    add(background);

    // 🔹 Crear y asignar el sprite del jugador antes de instanciarlo
    final playerSprite = await loadSprite(Images.player);
    player = Player(sprite: playerSprite);
    add(player);

    // 🎮 Joystick de Movimiento
    moveJoystick = JoystickComponent(
      knob: CircleComponent(radius: 20, paint: Paint()..color = Colors.blue),
      background: CircleComponent(
        radius: 50,
        paint: Paint()..color = Colors.blue.withOpacity(0.3),
      ),
      margin: const EdgeInsets.only(right: 30, bottom: 30),
    );

    // 🔫 Joystick de Disparo
    shootJoystick = JoystickComponent(
      knob: CircleComponent(radius: 20, paint: Paint()..color = Colors.red),
      background: CircleComponent(
        radius: 50,
        paint: Paint()..color = Colors.red.withOpacity(0.3),
      ),
      margin: const EdgeInsets.only(left: 30, bottom: 30),
    );

    addAll([moveJoystick, shootJoystick]);
  }
}
