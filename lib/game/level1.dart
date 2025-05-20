import 'package:flame/components.dart';
import 'package:neon_revenant/game/coin_component.dart';

class Level1Component extends PositionComponent {
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // Añadir monedas en diferentes posiciones
    final coins = [
      Vector2(100, 100),
      Vector2(200, 150),
      Vector2(300, 200),
      Vector2(400, 250),
      Vector2(500, 300),
      Vector2(600, 350),
      Vector2(700, 400),
      Vector2(800, 450),
    ];

    for (final position in coins) {
      add(CoinComponent(position: position));
    }
  }
}
