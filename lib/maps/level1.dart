import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:flutter/material.dart';
import 'package:neon_revenant/game/coin_component.dart';

class Level1Component extends SpriteComponent with HasGameRef {
  Level1Component() : super(size: Vector2(800, 800), anchor: Anchor.topLeft);

  final int _numCoins = 10;
  final Random _random = Random();

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    sprite = await Sprite.load('level1.jpg');

    // Añadir hitbox para el mapa
    add(
      RectangleHitbox(size: size, position: Vector2.zero())..debugMode = true,
    );

    // Generar monedas
    _generateCoins();
  }

  void _generateCoins() {
    // Área segura para las monedas (cubriendo todo el mapa)
    final coinSize = 32.0; // Tamaño de la moneda
    final safeArea = Rect.fromPoints(
      const Offset(0, 0), // Esquina superior izquierda
      Offset(
        800 - coinSize,
        800 - coinSize,
      ), // Esquina inferior derecha (ajustada por el tamaño de la moneda)
    );

    for (int i = 0; i < _numCoins; i++) {
      final x = _random.nextDouble() * (safeArea.width) + safeArea.left;
      final y = _random.nextDouble() * (safeArea.height) + safeArea.top;

      final coin = CoinComponent(position: Vector2(x, y));
      // Asegurarnos de que la moneda esté en la misma capa que el jugador
      coin.priority = 1;
      add(coin);
    }
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    // Debug: dibujar el área segura
    final paint =
        Paint()
          ..color = Colors.green.withOpacity(0.3)
          ..style = PaintingStyle.fill;
    canvas.drawRect(
      Rect.fromPoints(const Offset(0, 0), const Offset(800, 800)),
      paint,
    );
  }
}
