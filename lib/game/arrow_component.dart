import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class ArrowComponent extends PositionComponent {
  ArrowComponent()
    : super(
        position: Vector2(405.93, 532.52), // 30 píxeles arriba del texto ENTER
        size: Vector2(32, 32),
        anchor: Anchor.center,
      );

  @override
  void render(Canvas canvas) {
    final paint =
        Paint()
          ..color = Colors.green
          ..style = PaintingStyle.fill;

    // Dibujar una flecha apuntando hacia abajo
    final path =
        Path()
          ..moveTo(0, 0)
          ..lineTo(16, 32)
          ..lineTo(32, 0)
          ..close();

    canvas.drawPath(path, paint);
  }
}
