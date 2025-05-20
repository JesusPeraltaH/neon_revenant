import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:neon_revenant/game/neon_revenant_game.dart';
import 'package:neon_revenant/game/score_component.dart';

class HudComponent extends PositionComponent with HasGameRef<NeonRevenantGame> {
  late ScoreComponent scoreComponent;

  HudComponent()
    : super(priority: 1000, position: Vector2.zero(), size: Vector2.zero());

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // Actualizar el tamaño del HUD para que coincida con el tamaño del juego
    size = gameRef.size;

    // Crear y añadir el componente de score
    scoreComponent = ScoreComponent();
    add(scoreComponent);
  }

  @override
  void render(Canvas canvas) {
    // Dibujar un fondo semi-transparente para el HUD
    final paint =
        Paint()
          ..color = Colors.black.withOpacity(0.3)
          ..style = PaintingStyle.fill;

    canvas.drawRect(Rect.fromLTWH(0, 0, size.x, 60), paint);

    // Renderizar todos los componentes hijos
    super.render(canvas);
  }

  @override
  void update(double dt) {
    super.update(dt);
    // Asegurarse de que el tamaño del HUD coincida con el tamaño del juego
    size = gameRef.size;
  }
}
