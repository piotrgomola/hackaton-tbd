import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class WorldCollidable extends PositionComponent with CollisionCallbacks {
  // @override
  // void onCollision(Set<Vector2> points, PositionComponent other) {
  //   if (other is ScreenHitbox) {
  //     //...
  //   } else if (other is YourOtherComponent) {
  //     //...
  //   }
  // }
  //
  // @override
  // void onCollisionEnd(PositionComponent other) {
  //   if (other is ScreenHitbox) {
  //     //...
  //   } else if (other is YourOtherComponent) {
  //     //...
  //   }
  // }
}
