import 'package:flame/components.dart';

class SpeedyWorld extends SpriteComponent with HasGameRef {
  @override
  Future<void>? onLoad() async {
    sprite = await gameRef.loadSprite('map.png');
    size = sprite!.originalSize;
    return super.onLoad();
  }
}
//
// class BorderComponent extends Object {}
