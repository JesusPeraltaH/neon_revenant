import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart'; // Necesario para HasGameRef si PlayerComponent lo usa
import 'package:flutter/material.dart'; // Para Vector2
// Importa tu PlayerComponent y LittleRoot (adaptado a Flame)
import 'package:neon_revenant/game/player_component.dart';
import 'package:neon_revenant/maps/littleroot.dart';
//import 'package:neon_revenant/maps/littleroot_component.dart'; // Asumimos que creas esta versión

class NeonRevenantGame extends FlameGame with HasGameRef { // Añade HasGameRef si los componentes lo necesitan
  late PlayerComponent player;
  late LittleRootMapComponent mapComponent; // Componente Flame para el mapa

  // Dirección actual del joystick de movimiento
  Vector2 movementDirection = Vector2.zero();
  // Dirección actual del joystick de disparo (si la necesitas en el game loop)
  Vector2 shootingDirection = Vector2.zero();

  // Mundo virtual donde viven el mapa y el jugador
  late World gameWorld;
  // Cámara que sigue al jugador
  late CameraComponent gameCamera;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // --- Configuración del Mundo y la Cámara ---
    gameWorld = World();
    // El tamaño de la cámara usualmente coincide con el tamaño del viewport del juego
    // fixedResolution es una buena forma de manejar diferentes tamaños de pantalla
    gameCamera = CameraComponent.withFixedResolution(
      world: gameWorld,
      width: size.x, // Ancho de la vista del juego
      height: size.y, // Alto de la vista del juego
    );
    gameCamera.viewfinder.anchor = Anchor.center; // Centra la cámara

    // Añade la cámara y el mundo al juego
    addAll([gameCamera, gameWorld]);
    // -----------------------------------------

    // --- Carga y añade el Mapa ---
    mapComponent = LittleRootMapComponent(); // Crea tu componente de mapa
    await gameWorld.add(mapComponent); // Añade el mapa al mundo
    // -----------------------------

    // --- Carga y añade al Jugador ---
    player = PlayerComponent(); // Crea tu jugador
    // Posiciona al jugador (p.ej., en el centro del mapa o en un punto de inicio)
    // Necesitarás saber las dimensiones o un punto específico de tu mapa
    player.position = mapComponent.size / 2; // Ejemplo: centro del mapa
    await gameWorld.add(player); // Añade el jugador al mundo
    // ------------------------------

    // --- Haz que la cámara siga al jugador ---
    gameCamera.follow(player);
    // ----------------------------------------
  }

  // (Opcional) Puedes tener un método update aquí si necesitas lógica global
  // @override
  // void update(double dt) {
  //   super.update(dt);
  //   // Lógica global del juego si es necesaria
  // }
}