import 'package:flame/extensions.dart';
import 'package:flame/game.dart';
import 'package:hackaton_tbd/game/speedy_player.dart';
import 'package:hackaton_tbd/game/speedy_world.dart';

class SpeedyGame extends FlameGame with HasCollisionDetection {
  final SpeedyPlayer _player = SpeedyPlayer();
  final SpeedyWorld _speedyWorld = SpeedyWorld();

  @override
  Future<void> onLoad() async {
    super.onLoad();
    await add(_speedyWorld);
    await add(_player);

    _player.position = _speedyWorld.size / 2;
    camera.followComponent(_player, worldBounds: Rect.fromLTRB(0, 0, _speedyWorld.size.x, _speedyWorld.size.y));
  }

  void onJoypadDirectionChanged(Direction direction) {
    _player.direction = direction;
  }
}
