// ignore_for_file: public_member_api_docs, sort_constructors_first
// Import necessary packages
import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:test/test.dart';

import 'package:texture_packer/texture_packer.dart';

class TexturePackerFrame {
  final String name;
  final int x;
  final int y;
  final int w;
  final int h;

  factory TexturePackerFrame.fromMap(Map<String, dynamic> map) {
    return TexturePackerFrame(
      map['name'] as String,
      map['x'] as int,
      map['y'] as int,
      map['w'] as int,
      map['h'] as int,
    );
  }

  TexturePackerFrame(
    this.name,
    this.x,
    this.y,
    this.w,
    this.h,
  );

  TexturePackerFrame copyWith({
    String? name,
    int? x,
    int? y,
    int? w,
    int? h,
  }) {
    return TexturePackerFrame(
      name ?? this.name,
      x ?? this.x,
      y ?? this.y,
      w ?? this.w,
      h ?? this.h,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'x': x,
      'y': y,
      'w': w,
      'h': h,
    };
  }

  String toJson() => json.encode(toMap());

  factory TexturePackerFrame.fromJson(String source) =>
      TexturePackerFrame.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TexturePackerFrame(name: $name, x: $x, y: $y, w: $w, h: $h)';
  }

  @override
  bool operator ==(covariant TexturePackerFrame other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.x == x &&
        other.y == y &&
        other.w == w &&
        other.h == h;
  }

  @override
  int get hashCode {
    return name.hashCode ^ x.hashCode ^ y.hashCode ^ w.hashCode ^ h.hashCode;
  }
}

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
    final String name = "name";
    final int x = 1;
    final int y = 2;
    final int w = 3;
    final int h = 4;
    test('should copyWith', () async {
      // Arrange
      final texturePackerSpritesheet = TexturePackerSpritesheet.fromJson(
        spritesheetJson,
      );

      // Act
      final copiedSpritesheet = texturePackerSpritesheet.copyWith();

      // Assert
      expect(copiedSpritesheet, texturePackerSpritesheet);
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
      expect(fromMapSpritesheet, texturePackerSpritesheet);
    });

    test('should toJson', () async {
      // Arrange
      final texturePackerSpritesheet = TexturePackerSpritesheet.fromJson(
        spritesheetJson,
      );

      // Act
      final toJson = texturePackerSpritesheet.toJson();

      // Assert
      expect(toJson, spritesheetJson);
    });

    test('should fromJson', () async {
      // Arrange
      final texturePackerSpritesheet = TexturePackerSpritesheet.fromJson(
        spritesheetJson,
      );

      // Act
      final toJson = texturePackerSpritesheet.toJson();

      // Assert
      expect(toJson, spritesheetJson);
    });

    test('should create an instance with default values', () async {
      // Act
      final texturePackerSpritesheet = TexturePackerSpritesheet();

      // Assert
      expect(texturePackerSpritesheet.frames, isEmpty);
      expect(texturePackerSpritesheet.animations, isEmpty);
      expect(texturePackerSpritesheet.meta, TexturePackerMetadata.empty);
    });

    test('should create an instance with provided values', () async {
      // Arrange
      final frames = [
        TexturePackerFrame(name, x, y, w, h),
        TexturePackerFrame(name, x, y, w, h)
      ];
      final animations = [TexturePackerAnimation(), TexturePackerAnimation()];
      final meta = TexturePackerMetadata(image: 'image.png', format: 'RGBA');

      // Act
      final texturePackerSpritesheet = TexturePackerSpritesheet(
        frames: frames,
        animations: animations,
        meta: meta,
      );

      // Assert
      expect(texturePackerSpritesheet.frames, frames);
      expect(texturePackerSpritesheet.animations, animations);
      expect(texturePackerSpritesheet.meta, meta);
    });

    test('should copy an instance with new values', () async {
      // Arrange
      final original = TexturePackerSpritesheet(
        frames: [TexturePackerFrame(name, x, y, w, h)],
        animations: [TexturePackerAnimation()],
        meta: TexturePackerMetadata(image: 'image.png', format: 'RGBA'),
      );

      final newFrames = [
        TexturePackerFrame(name, x, y, w, h),
        TexturePackerFrame(name, x, y, w, h)
      ];
      final newAnimations = [
        TexturePackerAnimation(),
        TexturePackerAnimation()
      ];
      final newMeta =
          TexturePackerMetadata(image: 'new_image.png', format: 'RGB');

      // Act
      final copied = original.copyWith(
        frames: newFrames,
        animations: newAnimations,
        meta: newMeta,
      );

      // Assert
      expect(copied.frames, newFrames);
      expect(copied.animations, newAnimations);
      expect(copied.meta, newMeta);
    });

    // Add more tests based on your specific requirements and use cases
  });
}
