import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class HouseHitbox extends PositionComponent with CollisionCallbacks {
  HouseHitbox(List<Vector2> vertices) : super() {
    add(PolygonHitbox(vertices));
  }
}
