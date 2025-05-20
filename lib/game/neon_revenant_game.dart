import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart'; // Necesario para HasGameRef si PlayerComponent lo usa
import 'package:flutter/material.dart'; // Para Vector2
import 'package:flame/collisions.dart'; // Importa el sistema de colisiones de Flame
// Importa tu PlayerComponent y LittleRoot (adaptado a Flame)
import 'package:neon_revenant/game/player_component.dart';
import 'package:neon_revenant/maps/littleroot.dart';
import 'package:neon_revenant/maps/level1.dart';
// import 'package:neon_revenant/game/interactive_area.dart';
// import 'package:neon_revenant/game/level_text.dart';
// import 'package:neon_revenant/game/hud_component.dart';
import 'package:neon_revenant/game/score_component.dart';
import 'package:neon_revenant/game/finished_text_component.dart';
import 'package:neon_revenant/game/arrow_component.dart';
import 'package:neon_revenant/game/level_text.dart';
//import 'package:neon_revenant/maps/littleroot_component.dart'; // Asumimos que creas esta versión

// // class HouseHitboxComponent extends PositionComponent with CollisionCallbacks {
// //   HouseHitboxComponent() : super(anchor: Anchor.topLeft);

// //   @override
// //   Future<void> onLoad() async {
// //     await super.onLoad();
// //     add(
// //       PolygonHitbox([
// //         Vector2(187.25, 144.97),
// //         Vector2(15.47, 138.77),
// //         Vector2(0, 3.74),
// //         Vector2(188.61, 0),
// //       ])..debugMode = true,
// //     );
// //   }
// // }

// class NeonRevenantGame extends FlameGame with HasGameRef {
//   late PlayerComponent player;
//   late SpriteComponent mapComponent;
//   // late InteractiveArea interactiveArea;
//   late CameraComponent camera;
//   double time = 0.0;
//   int _score = 0;
//   Function(int)? onScoreChanged;
//   late ScoreComponent scoreComponent;

//   NeonRevenantGame({this.onScoreChanged}) {
//     debugMode = false;
//     mapComponent = SpriteComponent();
//     camera = CameraComponent();
//   }

//   // Dirección actual del joystick de movimiento
//   Vector2 movementDirection = Vector2.zero();
//   // Dirección actual del joystick de disparo
//   Vector2 shootingDirection = Vector2.zero();

//   @override
//   Future<void> onLoad() async {
//     print('Iniciando onLoad...');
//     await super.onLoad();
//     time = 0.0;

//     // Configurar la cámara
//     print('Configurando cámara...');
//     camera.viewfinder.anchor = Anchor.topLeft;
//     camera.viewfinder.position = Vector2.zero();
//     camera.viewfinder.zoom = 0.5;
//     add(camera);
//     print('Cámara configurada y añadida. Tamaño del juego: $size');

//     // Inicializar el jugador primero
//     print('Inicializando jugador...');
//     player = PlayerComponent();
//     player.priority = 1;
//     camera.add(player);
//     print('Jugador inicializado y añadido a la cámara');

//     // Inicializar el score
//     print('Inicializando score...');
//     scoreComponent = ScoreComponent();
//     add(scoreComponent);
//     print('Score inicializado y añadido');

//     // Cargar el mapa inicial (LittleRoot)
//     print('Cargando mapa inicial...');
//     await loadNewMap('town.png');
//     print('Mapa inicial cargado');
//   }

//   @override
//   void render(Canvas canvas) {
//     // Dibujar un fondo azul para debug
//     canvas.drawRect(
//       Rect.fromLTWH(0, 0, size.x, size.y),
//       Paint()..color = Colors.blue.withOpacity(0.3),
//     );

//     super.render(canvas);
//   }

//   Future<void> loadNewMap(String mapPath) async {
//     print('Iniciando loadNewMap con ruta: $mapPath');

//     if (camera.children.contains(mapComponent)) {
//       camera.remove(mapComponent);
//     }

//     // Cargar el nuevo mapa
//     // if (mapPath == 'level1.jpg') {
//     //   mapComponent = Level1Component();
//     //   player.position = Vector2(400, 400);
//     // } else {
//     mapComponent = LittleRootMapComponent();
//     player.position = Vector2(100, 300);
//     // }

//     camera.add(mapComponent);
//     print('Mapa añadido a la cámara - Tamaño: ${mapComponent.size}');

//     // interactiveArea = InteractiveArea(this);
//     // camera.add(interactiveArea);
//   }

//   // void onActionButtonPressed() {
//   //   interactiveArea.onActionButtonPressed();
//   // }

//   @override
//   void update(double dt) {
//     super.update(dt);
//     time += dt;

//     if (time.floor() != (time - dt).floor()) {
//       print('Tiempo de juego: ${time.floor()} segundos');
//     }

//     if (movementDirection != Vector2.zero()) {
//       final newPosition =
//           player.position + movementDirection.normalized() * 200 * dt;

//       final mapWidth = mapComponent.size.x;
//       final mapHeight = mapComponent.size.y;
//       final playerSize = player.size;

//       newPosition.x = newPosition.x.clamp(
//         playerSize.x / 2,
//         mapWidth - playerSize.x / 2,
//       );
//       newPosition.y = newPosition.y.clamp(
//         playerSize.y / 2,
//         mapHeight - playerSize.y / 2,
//       );

//       player.position = newPosition;
//     }
//   }

//   void addScore(int points) {
//     _score += points;
//     onScoreChanged?.call(_score);
//   }

//   int get score => _score;
// }

// import 'package:flame/components.dart';
// import 'package:flame/game.dart';
// import 'package:flame/input.dart'; // Necesario para HasGameRef si PlayerComponent lo usa
// import 'package:flutter/material.dart'; // Para Vector2
// // Importa tu PlayerComponent y LittleRoot (adaptado a Flame)
// import 'package:neon_revenant/game/player_component.dart';
// import 'package:neon_revenant/maps/littleroot.dart';
// //import 'package:neon_revenant/maps/littleroot_component.dart'; // Asumimos que creas esta versión

// class NeonRevenantGame extends FlameGame with HasGameRef {
//   // Añade HasGameRef si los componentes lo necesitan
//   late PlayerComponent player;
//   late LittleRootMapComponent mapComponent; // Componente Flame para el mapa

//   // Dirección actual del joystick de movimiento
//   Vector2 movementDirection = Vector2.zero();
//   // Dirección actual del joystick de disparo (si la necesitas en el game loop)
//   Vector2 shootingDirection = Vector2.zero();

//   // Mundo virtual donde viven el mapa y el jugador
//   late World gameWorld;
//   // Cámara que sigue al jugador
//   late CameraComponent gameCamera;

//   @override
//   Future<void> onLoad() async {
//     await super.onLoad();

//     // --- Configuración del Mundo y la Cámara ---
//     gameWorld = World();
//     // El tamaño de la cámara usualmente coincide con el tamaño del viewport del juego
//     // fixedResolution es una buena forma de manejar diferentes tamaños de pantalla
//     gameCamera = CameraComponent.withFixedResolution(
//       world: gameWorld,
//       width: size.x, // Ancho de la vista del juego
//       height: size.y, // Alto de la vista del juego
//     );
//     gameCamera.viewfinder.anchor = Anchor.center; // Centra la cámara

//     // Añade la cámara y el mundo al juego
//     addAll([gameCamera, gameWorld]);
//     // -----------------------------------------

//     // --- Carga y añade el Mapa ---
//     mapComponent = LittleRootMapComponent(); // Crea tu componente de mapa
//     await gameWorld.add(mapComponent); // Añade el mapa al mundo
//     // -----------------------------

//     // --- Carga y añade al Jugador ---
//     player = PlayerComponent(); // Crea tu jugador
//     // Posiciona al jugador (p.ej., en el centro del mapa o en un punto de inicio)
//     // Necesitarás saber las dimensiones o un punto específico de tu mapa
//     player.position = mapComponent.size / 2; // Ejemplo: centro del mapa
//     await gameWorld.add(player); // Añade el jugador al mundo
//     // ------------------------------

//     // --- Haz que la cámara siga al jugador ---
//     gameCamera.follow(player);
//     // ----------------------------------------
//   }

//   // (Opcional) Puedes tener un método update aquí si necesitas lógica global
//   // @override
//   // void update(double dt) {
//   //   super.update(dt);
//   //   // Lógica global del juego si es necesaria
//   // }
// }

// Importa el sistema de colisiones de Flame

class StaticHitboxComponent extends PositionComponent with CollisionCallbacks {
  StaticHitboxComponent()
    : super(
        position: Vector2(266.22, 413.52),
        size: Vector2(192.55, 137.81),
        anchor: Anchor.topLeft,
      );

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // Añadir una hitbox rectangular simple
    add(
      RectangleHitbox(
        size: size,
        position: Vector2.zero(),
        anchor: Anchor.topLeft,
      )..debugMode = true,
    );
  }

  @override
  void render(Canvas canvas) {
    // Dibujar el área de colisión en rojo sólido
    final paint =
        Paint()
          ..color = Colors.red.withOpacity(0.5)
          ..style = PaintingStyle.fill;

    canvas.drawRect(Rect.fromLTWH(0, 0, size.x, size.y), paint);
    super.render(canvas);
  }
}

class EnterTextComponent extends TextComponent
    with HasGameRef<NeonRevenantGame> {
  static const double detectionRadius = 50.0; // Radio de detección
  bool isPlayerNear = false;

  EnterTextComponent()
    : super(
        text: 'ENTER',
        position: Vector2(405.93, 562.52),
        textRenderer: TextPaint(
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(color: Colors.black, offset: Offset(2, 2), blurRadius: 2),
            ],
          ),
        ),
        anchor: Anchor.center,
      );

  @override
  void update(double dt) {
    super.update(dt);

    // Verificar la distancia al jugador
    final playerDistance = (gameRef.player.position - position).length;
    final wasPlayerNear = isPlayerNear;
    isPlayerNear = playerDistance < detectionRadius;

    // Actualizar el color del texto cuando el jugador está cerca
    if (isPlayerNear != wasPlayerNear) {
      textRenderer = TextPaint(
        style: TextStyle(
          color: isPlayerNear ? Colors.yellow : Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          shadows: const [
            Shadow(color: Colors.black, offset: Offset(2, 2), blurRadius: 2),
          ],
        ),
      );
    }
  }
}

class NeonRevenantGame extends FlameGame
    with HasGameRef, HasCollisionDetection {
  late PlayerComponent player;
  late PositionComponent mapComponent;
  late StaticHitboxComponent staticHitbox;
  late EnterTextComponent enterText;
  late World gameWorld;
  late CameraComponent gameCamera;
  late ScoreComponent scoreComponent;
  FinishedTextComponent? finishedText;
  ArrowComponent? arrowComponent;
  Vector2 movementDirection = Vector2.zero();
  Vector2 shootingDirection = Vector2.zero();
  int _score = 0;
  bool _hasCompletedLevel = false;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // Habilitar el modo debug para ver las colisiones
    debugMode = true;

    // Configurar el mundo y la cámara
    gameWorld = World();
    gameCamera = CameraComponent.withFixedResolution(
      world: gameWorld,
      width: size.x,
      height: size.y,
    );
    gameCamera.viewfinder.anchor = Anchor.center;
    addAll([gameCamera, gameWorld]);

    // Añadir el componente de score
    scoreComponent = ScoreComponent();
    add(scoreComponent);

    // Cargar el mapa inicial
    await loadMap('littleroot');
  }

  Future<void> loadMap(String mapName) async {
    // Limpiar el mundo actual
    gameWorld.removeAll(gameWorld.children);

    if (mapName == 'littleroot') {
      // Cargar el mapa de LittleRoot
      mapComponent = LittleRootMapComponent();
      await gameWorld.add(mapComponent);

      // Crear y añadir el jugador
      player = PlayerComponent();
      await gameWorld.add(player);
      player.position = Vector2(mapComponent.size.x / 2, 200);

      // Crear y añadir la hitbox estática
      staticHitbox = StaticHitboxComponent();
      await gameWorld.add(staticHitbox);

      // Crear y añadir el texto ENTER
      enterText = EnterTextComponent();
      await gameWorld.add(enterText);

      // Si el nivel ha sido completado, mostrar la flecha
      if (_hasCompletedLevel) {
        arrowComponent = ArrowComponent();
        await gameWorld.add(arrowComponent!);
      }
    } else if (mapName == 'level1') {
      // Cargar el mapa Level1
      mapComponent = Level1Component();
      await gameWorld.add(mapComponent);

      // Crear y añadir el jugador en la nueva posición
      player = PlayerComponent();
      await gameWorld.add(player);
      player.position = Vector2(400, 400);

      // Mostrar el texto de nivel solo si es la primera vez
      if (!_hasCompletedLevel) {
        final levelText = LevelText();
        await gameWorld.add(levelText);
      }
    }

    // Hacer que la cámara siga al jugador
    gameCamera.follow(player);
  }

  void addScore(int points) {
    _score += points;
    scoreComponent.updateScore(_score);

    // Mostrar el texto Finished! cuando el score llegue a 100
    if (_score >= 100 && finishedText == null) {
      finishedText = FinishedTextComponent();
      gameWorld.add(finishedText!);
      _hasCompletedLevel = true; // Marcar el nivel como completado
    }
  }

  void onActionButtonPressed() {
    // Verificar si el jugador está cerca del texto ENTER
    if (enterText.isPlayerNear) {
      print('Cambiando a Level1...');
      loadMap('level1');
    }
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (movementDirection != Vector2.zero() && !player.isColliding) {
      final newPosition =
          player.position + movementDirection.normalized() * player.speed * dt;

      // Verificar límites del mapa
      final mapWidth = mapComponent.size.x;
      final mapHeight = mapComponent.size.y;
      final playerSize = player.size;

      newPosition.x = newPosition.x.clamp(
        playerSize.x / 2,
        mapWidth - playerSize.x / 2,
      );
      newPosition.y = newPosition.y.clamp(
        playerSize.y / 2,
        mapHeight - playerSize.y / 2,
      );

      player.position = newPosition;
    }
  }
}
