import 'package:test/test.dart';

import 'package:texture_packer/texture_packer.dart';

void main() {
  group("$TexturePackerSpritesheet", () {
    final frame1 = TexturePackerFrame(
      name: 'frame1',
      height: 1.0,
      rotated: false,
      sourceHeight: 1.0,
      sourceWidth: 1.0,
      spriteSourceHeight: 1.0,
      spriteSourceWidth: 1.0,
      spriteSourceX: 1.0,
      spriteSourceY: 1.0,
      trimmed: false,
      width: 1.0,
      x: 5,
      y: 5,
    );
    final frame2 = TexturePackerFrame(
      name: 'frame2',
      height: 1.0,
      rotated: false,
      sourceHeight: 1.0,
      sourceWidth: 1.0,
      spriteSourceHeight: 1.0,
      spriteSourceWidth: 1.0,
      spriteSourceX: 1.0,
      spriteSourceY: 1.0,
      trimmed: false,
      width: 1.0,
      x: 5,
      y: 5,
    );
    test('copyWith method creates a new object with specified properties', () {
      final originalSheet = TexturePackerSpritesheet(
        frames: [frame1],
        animations: [TexturePackerAnimation(name: 'animation1', frames: [])],
        meta: TexturePackerMetadata.empty,
      );

      final copiedSheet = originalSheet.copyWith(
        frames: [frame2],
        animations: [TexturePackerAnimation(name: 'animation2', frames: [])],
        meta: TexturePackerMetadata.empty,
      );

      expect(copiedSheet.frames, [frame2]);
      expect(copiedSheet.animations,
          [TexturePackerAnimation(name: 'animation2', frames: [])]);
      expect(copiedSheet.meta, TexturePackerMetadata.empty);
    });

    test('toMap method converts the spritesheet object to a map', () {
      final spritesheet = TexturePackerSpritesheet(
        frames: [frame1],
        animations: [TexturePackerAnimation(name: 'animation1', frames: [])],
        meta: TexturePackerMetadata.empty,
      );

      final map = spritesheet.toMap();

      expect(map['frames'], isA<List<Map<String, dynamic>>>());
      expect(map['animations'], isA<List<Map<String, dynamic>>>());
      expect(map['meta'], isA<Map<String, dynamic>>());
    });

    test('fromMap method creates a spritesheet object from a map', () {
      final map = {
        'frames': [
          {'name': 'frame1'}
        ],
        'animations': [
          {'name': 'animation1', 'frames': []}
        ],
        'meta': {},
      };

      final spritesheet = TexturePackerSpritesheet.fromMap(map);

      expect(spritesheet.frames, [frame1]);
      expect(spritesheet.animations,
          [TexturePackerAnimation(name: 'animation1', frames: [])]);
      expect(spritesheet.meta, TexturePackerMetadata.empty);
    });

    test(
        'toJson and fromJson methods convert the spritesheet object to JSON and vice versa',
        () {
      final spritesheet = TexturePackerSpritesheet(
        frames: [frame1],
        animations: [TexturePackerAnimation(name: 'animation1', frames: [])],
        meta: TexturePackerMetadata.empty,
      );

      final json = spritesheet.toJson();
      final parsedSpritesheet = TexturePackerSpritesheet.fromJson(json);

      expect(parsedSpritesheet, spritesheet);
    });
  });
}
