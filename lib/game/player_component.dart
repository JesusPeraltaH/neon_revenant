// import 'package:flame/components.dart';
// import 'package:flame/palette.dart';
// import 'package:flutter/material.dart';

// class PlayerComponent extends StatelessWidget{
    
//     @override
//       Widget build(BuildContext context){
//         return Container(
//           height: 50,
//           child: Image.asset('assets/images/player.png',
//           fit: BoxFit.cover,
//           ),

//         );
//     }
// }

import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:flame/flame.dart';
import 'package:neon_revenant/game/neon_revenant_game.dart';

class PlayerComponent extends SpriteAnimationComponent with HasGameRef<NeonRevenantGame> {
  double speed = 150.0;
  SpriteAnimation? animationUp;
  SpriteAnimation? animationDown;
  SpriteAnimation? animationLeft;
  SpriteAnimation? animationRight;
  SpriteAnimation? currentAnimation; // La animación que se está mostrando actualmente

  PlayerComponent() : super(size: Vector2(64.0, 80.0), anchor: Anchor.center);

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
    animationDown = SpriteAnimation.fromFrameData(spriteSheetDown, spriteDataDown);

    // --- Cargar animación para IZQUIERDA/DERECHA ---
    final spriteSheetLeft = await Flame.images.load('player_left.png');
    final spriteDataLeft = SpriteAnimationData.sequenced(
      amount: 3,
      stepTime: 0.15,
      textureSize: Vector2(64, 80),
    );
    animationLeft = SpriteAnimation.fromFrameData(spriteSheetLeft, spriteDataLeft);

    final spriteSheetRight = await Flame.images.load('player_right.png');
    final spriteDataRight = SpriteAnimationData.sequenced(
      amount: 3,
      stepTime: 0.15,
      textureSize: Vector2(64, 80),
    );
    animationRight = SpriteAnimation.fromFrameData(spriteSheetRight, spriteDataRight);

    // Establecer la animación inicial (por ejemplo, hacia abajo)
    currentAnimation = animationDown;
    animation = currentAnimation;
  }

  @override
  void update(double dt) {
    super.update(dt);

    final Vector2 direction = gameRef.movementDirection;

    if (direction.y < 0) { // Moviéndose hacia arriba
      currentAnimation = animationUp;
    } else if (direction.y > 0) { // Moviéndose hacia abajo
      currentAnimation = animationDown;
    } else if (direction.x < 0) { // Moviéndose hacia la izquierda
      currentAnimation = animationLeft;
      flipHorizontally();
       // Usar renderFlipX para SpriteComponent/SpriteAnimationComponent
    } else if (direction.x > 0) { // Moviéndose hacia la derecha
      currentAnimation = animationRight;
      flipVertically();
    } else {
      // Si no hay movimiento, puedes mostrar una animación de "idle" si la tienes
      // currentAnimation = animationIdle;
    }

    // Actualizar la animación mostrada solo si ha cambiado
    if (animation != currentAnimation) {
      animation = currentAnimation;
      //animation?.reset(); // Llamar a reset() solo si animation no es nulo
    }

    if (direction != Vector2.zero()) {
      position.add(direction.normalized() * speed * dt);
    }
  }
}