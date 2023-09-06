// Import necessary packages
import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:test/test.dart';
import 'dart:convert';
import 'package:texture_packer/texture_packer.dart';

void main() {
  const spritesheetFixture = 'assets/test/fixtures/character_spritesheet.json';
  late String spritesheetJson;

  setUpAll(() async {
    final jsonPath = path.join(
      Directory.current.path,
      spritesheetFixture,
    );
    final file = File(jsonPath);
    spritesheetJson = json.decode(file.readAsStringSync());
  });

  group('$TexturePackerSpritesheet', () {
    test('should copyWith', () async {
      // Arrange
      final texturePackerSpritesheet = TexturePackerSpritesheet.fromJson(
        spritesheetJson,
      );

      // Act
      final copiedSpritesheet = texturePackerSpritesheet.copyWith();

      // Assert
      expect(copiedSpritesheet, equals(texturePackerSpritesheet));
    });

    test('should toMap', () async {
      // Arrange
      final texturePackerSpritesheet = TexturePackerSpritesheet.fromJson(
        spritesheetJson,
      );

      // Act
      final spriteSheetMap = texturePackerSpritesheet.toMap();

      // Assert
      expect(spriteSheetMap, isMap);
      // Add more specific assertions based on the expected content of spriteSheetMap
    });

    test('should fromMap', () async {
      // Arrange
      final texturePackerSpritesheet = TexturePackerSpritesheet.fromJson(
        spritesheetJson,
      );
      final spriteSheetMap = texturePackerSpritesheet.toMap();

      // Act
      final fromMapSpritesheet =
          TexturePackerSpritesheet.fromMap(spriteSheetMap);

      // Assert
      expect(fromMapSpritesheet, equals(texturePackerSpritesheet));
    });

    test('should toJson', () async {
      // Arrange
      final texturePackerSpritesheet = TexturePackerSpritesheet.fromJson(
        spritesheetJson,
      );

      // Act
      final toJson = texturePackerSpritesheet.toJson();

      // Assert
      expect(toJson, equals(spritesheetJson));
    });

    test('should fromJson', () async {
      // Arrange
      final texturePackerSpritesheet = TexturePackerSpritesheet.fromJson(
        spritesheetJson,
      );

      // Act
      final toJson = texturePackerSpritesheet.toJson();

      // Assert
      expect(toJson, equals(spritesheetJson));
    });

    test('should create an instance with default values', () async {
      // Act
      final texturePackerSpritesheet = TexturePackerSpritesheet();

      // Assert
      expect(texturePackerSpritesheet.frames, isEmpty);
      expect(texturePackerSpritesheet.animations, isEmpty);
      expect(
          texturePackerSpritesheet.meta, equals(TexturePackerMetadata.empty));
    });

    // test('should create an instance with provided values', () async {
    //   // Arrange
    //   final frames = [TexturePackerFrame(), TexturePackerFrame()];
    //   final animations = [TexturePackerAnimation(), TexturePackerAnimation()];
    //   final meta = TexturePackerMetadata(image: 'image.png', format: 'RGBA');

    //   // Act
    //   final texturePackerSpritesheet = TexturePackerSpritesheet(
    //     frames: frames,
    //     animations: animations,
    //     meta: meta,
    //   );

    //   // Assert
    //   expect(texturePackerSpritesheet.frames, equals(frames));
    //   expect(texturePackerSpritesheet.animations, equals(animations));
    //   expect(texturePackerSpritesheet.meta, equals(meta));
    // });

    // test('should copy an instance with new values', () async {
    //   // Arrange
    //   final original = TexturePackerSpritesheet(
    //     frames: [TexturePackerFrame()],
    //     animations: [TexturePackerAnimation()],
    //     meta: TexturePackerMetadata(image: 'image.png', format: 'RGBA'),
    //   );

    //   final newFrames = [TexturePackerFrame(), TexturePackerFrame()];
    //   final newAnimations = [
    //     TexturePackerAnimation(),
    //     TexturePackerAnimation()
    //   ];
    //   final newMeta =
    //       TexturePackerMetadata(image: 'new_image.png', format: 'RGB');

    //   // Act
    //   final copied = original.copyWith(
    //     frames: newFrames,
    //     animations: newAnimations,
    //     meta: newMeta,
    //   );

    //   // Assert
    //   expect(copied.frames, equals(newFrames));
    //   expect(copied.animations, equals(newAnimations));
    //   expect(copied.meta, equals(newMeta));
    // });

    // Add more tests based on your specific requirements and use cases
  });
}
