import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:flutter/material.dart';
import 'package:neon_revenant/game/neon_revenant_game.dart';

class InteractiveArea extends PositionComponent with CollisionCallbacks {
  final NeonRevenantGame game;
  bool isPlayerNear = false;
  late TextComponent enterText;

  InteractiveArea(this.game)
    : super(
        position: Vector2(391.02, 592.35),
        size: Vector2(50, 50), // Tamaño del área interactiva
      );

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // Añadir hitbox
    add(RectangleHitbox()..debugMode = false);

    // Crear texto "ENTER"
    enterText = TextComponent(
      text: 'ENTER',
      textRenderer: TextPaint(
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      position: Vector2(0, -30), // Posición relativa al área
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    // Verificar si el jugador está cerca
    final playerDistance = (game.player.position - position).length;
    final wasPlayerNear = isPlayerNear;
    isPlayerNear = playerDistance < 100; // Radio de detección

    // Actualizar visibilidad del texto
    if (isPlayerNear != wasPlayerNear) {
      if (isPlayerNear) {
        if (!children.contains(enterText)) {
          add(enterText);
        }
      } else {
        if (children.contains(enterText)) {
          remove(enterText);
        }
      }
    }
  }

  void onActionButtonPressed() {
    if (isPlayerNear) {
      // Aquí cargarías el nuevo mapa
      // game.loadNewMap('assets/images/level1.jpg');
    }
  }
}
