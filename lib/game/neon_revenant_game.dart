import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/geometry.dart';

class NeonRevenantGame extends Game {
  late SpriteComponent background;
  final Joystick movementJoystick = Joystick();
  final Joystick shootingJoystick = Joystick();

  @override
  Future<void> onLoad() async {
    // Cargar el fondo
    final backgroundSprite = await loadSprite(
      'background.png',
    ); // Asegúrate de tener este asset
    background =
        SpriteComponent()
          ..sprite = backgroundSprite
          ..size = size; // Tamaño del fondo igual al tamaño de la pantalla

    add(background);
  }

  @override
  void update(double dt) {
    // Aquí puedes agregar la lógica de movimiento y disparo en el futuro
    // Por ejemplo, actualizar la posición del jugador según el joystick de movimiento
  }

  @override
  void render(Canvas canvas) {
    // Renderizar el fondo
    background.render(canvas);
  }
}

class Joystick {
  Vector2 direction = Vector2.zero();

  void update(Vector2 delta) {
    direction = delta;
  }
}
