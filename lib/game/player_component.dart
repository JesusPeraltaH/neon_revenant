import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:flame/flame.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:neon_revenant/game/neon_revenant_game.dart';
import 'package:neon_revenant/widgets/components.dart';

class PlayerComponent extends SpriteAnimationComponent
    with HasGameRef<NeonRevenantGame>, CollisionCallbacks {
  double speed = 150.0;
  SpriteAnimation? animationUp;
  SpriteAnimation? animationDown;
  SpriteAnimation? animationLeft;
  SpriteAnimation? animationRight;
  SpriteAnimation? currentAnimation;
  bool isColliding = false;
  Vector2 _lastValidPosition = Vector2.zero();

  PlayerComponent() : super(size: Vector2(64.0, 80.0), anchor: Anchor.center);

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    if (other is StaticHitboxComponent) {
      isColliding = true;
      // Revertir inmediatamente a la última posición válida
      position = _lastValidPosition;
      print('Colisión detectada - Posición revertida a: $_lastValidPosition');
    }
    super.onCollisionStart(intersectionPoints, other);
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    if (other is StaticHitboxComponent) {
      isColliding = false;
      print('Fin de colisión');
    }
    super.onCollisionEnd(other);
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // --- Cargar animación para ARRIBA ---
    final spriteSheetUp = await Flame.images.load('player_up.png');
    final spriteDataUp = SpriteAnimationData.sequenced(
      amount: 3,
      stepTime: 0.15,
      textureSize: Vector2(64, 80),
    );
    animationUp = SpriteAnimation.fromFrameData(spriteSheetUp, spriteDataUp);

    // --- Cargar animación para ABAJO ---
    final spriteSheetDown = await Flame.images.load('player_down.png');
    final spriteDataDown = SpriteAnimationData.sequenced(
      amount: 3,
      stepTime: 0.15,
      textureSize: Vector2(64, 80),
    );
    animationDown = SpriteAnimation.fromFrameData(
      spriteSheetDown,
      spriteDataDown,
    );

    // --- Cargar animación para IZQUIERDA/DERECHA ---
    final spriteSheetLeft = await Flame.images.load('player_left.png');
    final spriteDataLeft = SpriteAnimationData.sequenced(
      amount: 3,
      stepTime: 0.15,
      textureSize: Vector2(64, 80),
    );
    animationLeft = SpriteAnimation.fromFrameData(
      spriteSheetLeft,
      spriteDataLeft,
    );

    final spriteSheetRight = await Flame.images.load('player_right.png');
    final spriteDataRight = SpriteAnimationData.sequenced(
      amount: 3,
      stepTime: 0.15,
      textureSize: Vector2(64, 80),
    );
    animationRight = SpriteAnimation.fromFrameData(
      spriteSheetRight,
      spriteDataRight,
    );

    // Establecer la animación inicial (por ejemplo, hacia abajo)
    currentAnimation = animationDown;
    animation = currentAnimation;

    // Añadir hitbox rectangular más grande
    add(
      RectangleHitbox(
        size: Vector2(48, 64), // Hitbox más grande
        position: Vector2(
          32,
          40,
        ), // Centrada exactamente en el sprite del jugador
        anchor: Anchor.center,
      )..debugMode = true,
    );
  }

  @override
  void update(double dt) {
    super.update(dt);

    final Vector2 direction = gameRef.movementDirection;
    bool isMoving = direction != Vector2.zero();

    if (isMoving) {
      // Actualizar animaciones
      if (direction.y < 0 &&
          (direction.y.abs() > direction.x.abs() || direction.x == 0)) {
        currentAnimation = animationUp;
      } else if (direction.y > 0 &&
          (direction.y.abs() > direction.x.abs() || direction.x == 0)) {
        currentAnimation = animationDown;
      } else if (direction.x < 0) {
        currentAnimation = animationLeft;
      } else if (direction.x > 0) {
        currentAnimation = animationRight;
      }
    }

    if (animation != currentAnimation && currentAnimation != null) {
      animation = currentAnimation;
    }

    // Guardar la posición actual si no estamos colisionando
    if (!isColliding) {
      _lastValidPosition = position;
    }

    if (isMoving) {
      // Obtener los límites del mapa
      final mapWidth = gameRef.mapComponent.size.x;
      final mapHeight = gameRef.mapComponent.size.y;

      // Los límites para el centro del jugador
      final minX = size.x / 2;
      final maxX = mapWidth - (size.x / 2);
      final minY = size.y / 2;
      final maxY = mapHeight - (size.y / 2);

      // Calcular la nueva posición
      Vector2 nextPosition = position + direction.normalized() * speed * dt;

      // Restringir la posición del jugador a los límites del mapa
      nextPosition.x = nextPosition.x.clamp(minX, maxX);
      nextPosition.y = nextPosition.y.clamp(minY, maxY);

      // Actualizar la posición
      position = nextPosition;
    }

    // Debug: Imprimir posición actual del jugador
    if (kDebugMode) {
      print(
        'Player Position: x=${position.x.toStringAsFixed(2)}, y=${position.y.toStringAsFixed(2)}',
      );
    }
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    // Debug: dibujar un borde alrededor del jugador
    final paint =
        Paint()
          ..color = Colors.blue
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.0;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.x, size.y), paint);
  }
}
