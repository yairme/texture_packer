// Dart imports:
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:vector_math/vector_math_64.dart';

class TexturePackerSpritesheet {
  final List<TexturePackerFrame> frames;
  final List<TexturePackerAnimation> animations;
  final TexturePackerMetadata meta;

  TexturePackerSpritesheet({
    this.frames = const [],
    this.animations = const [],
    this.meta = TexturePackerMetadata.empty,
  });

  TexturePackerSpritesheet copyWith({
    List<TexturePackerFrame>? frames,
    List<TexturePackerAnimation>? animations,
    TexturePackerMetadata? meta,
  }) {
    return TexturePackerSpritesheet(
      frames: frames ?? this.frames,
      animations: animations ?? this.animations,
      meta: meta ?? this.meta,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'frames': frames.map((x) => x.toMap()).toList(),
      'animations': animations.map((x) => x.toMap()).toList(),
      'meta': meta.toMap(),
    };
  }

  factory TexturePackerSpritesheet.fromMap(Map<String, dynamic> map) {
    return TexturePackerSpritesheet(
      frames:
          List<TexturePackerFrame>.from(map['frames']?.entries?.map((MapEntry<String, dynamic> e) {
        return TexturePackerFrame.fromMap(Map<String, dynamic>.from({
          "name": e.key,
          ...e.value,
        }));
      })),
      animations: List<TexturePackerAnimation>.from(
          map['animations']?.entries?.map((MapEntry<String, dynamic> e) {
        return TexturePackerAnimation.fromMap(Map<String, dynamic>.from({
          "name": e.key,
          "frames": e.value,
        }));
      })),
      meta: TexturePackerMetadata.fromMap(map['meta']),
    );
  }

  String toJson() => json.encode(toMap());

  // ignore: unused_element
  factory TexturePackerSpritesheet.fromJson(String source) =>
      TexturePackerSpritesheet.fromMap(json.decode(source));

  @override
  String toString() =>
      '$TexturePackerSpritesheet(frames: $frames, animations: $animations, meta: $meta)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TexturePackerSpritesheet &&
        ListEquality().equals(other.frames, frames) &&
        ListEquality().equals(other.animations, animations) &&
        other.meta == meta;
  }

  @override
  int get hashCode => frames.hashCode ^ animations.hashCode ^ meta.hashCode;
}

class TexturePackerFrame {
  final String name;
  final double x;
  final double y;
  final double width;
  final double height;
  final bool rotated;
  final bool trimmed;
  final double spriteSourceX;
  final double spriteSourceY;
  final double spriteSourceWidth;
  final double spriteSourceHeight;
  final double sourceWidth;
  final double sourceHeight;

  Vector2 get position => Vector2(x, y);
  Vector2 get size => Vector2(width, height);
  Vector2 get spriteSourcePosition => Vector2(spriteSourceX, spriteSourceY);
  Vector2 get spriteSourceSize => Vector2(spriteSourceWidth, spriteSourceHeight);
  Vector2 get sourceSize => Vector2(sourceWidth, sourceHeight);

  TexturePackerFrame({
    required this.name,
    required this.x,
    required this.y,
    required this.width,
    required this.height,
    required this.rotated,
    required this.trimmed,
    required this.spriteSourceX,
    required this.spriteSourceY,
    required this.spriteSourceWidth,
    required this.spriteSourceHeight,
    required this.sourceWidth,
    required this.sourceHeight,
  });

  TexturePackerFrame copyWith({
    String? name,
    double? x,
    double? y,
    double? width,
    double? height,
    bool? rotated,
    bool? trimmed,
    double? spriteSourceX,
    double? spriteSourceY,
    double? spriteSourceWidth,
    double? spriteSourceHeight,
    double? sourceWidth,
    double? sourceHeight,
  }) {
    return TexturePackerFrame(
      name: name ?? this.name,
      x: x ?? this.x,
      y: y ?? this.y,
      width: width ?? this.width,
      height: height ?? this.height,
      rotated: rotated ?? this.rotated,
      trimmed: trimmed ?? this.trimmed,
      spriteSourceX: spriteSourceX ?? this.spriteSourceX,
      spriteSourceY: spriteSourceY ?? this.spriteSourceY,
      spriteSourceWidth: spriteSourceWidth ?? this.spriteSourceWidth,
      spriteSourceHeight: spriteSourceHeight ?? this.spriteSourceHeight,
      sourceWidth: sourceWidth ?? this.sourceWidth,
      sourceHeight: sourceHeight ?? this.sourceHeight,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'x': x,
      'y': y,
      'width': width,
      'height': height,
      'rotated': rotated,
      'trimmed': trimmed,
      'spriteSourceX': spriteSourceX,
      'spriteSourceY': spriteSourceY,
      'spriteSourceWidth': spriteSourceWidth,
      'spriteSourceHeight': spriteSourceHeight,
      'sourceWidth': sourceWidth,
      'sourceHeight': sourceHeight,
    };
  }

  factory TexturePackerFrame.fromMap(Map<String, dynamic> map) {
    return TexturePackerFrame(
      name: map['name'] ?? '',
      x: double.tryParse(map['frame']['x'].toString()) ?? 0.0,
      y: double.tryParse(map['frame']['y'].toString()) ?? 0.0,
      width: double.tryParse(map['frame']['w'].toString()) ?? 0.0,
      height: double.tryParse(map['frame']['h'].toString()) ?? 0.0,
      rotated: map['rotated'] ?? false,
      trimmed: map['trimmed'] ?? false,
      spriteSourceX: double.tryParse(map['spriteSourceSize']['x'].toString()) ?? 0.0,
      spriteSourceY: double.tryParse(map['spriteSourceSize']['y'].toString()) ?? 0.0,
      spriteSourceWidth: double.tryParse(map['spriteSourceSize']['w'].toString()) ?? 0.0,
      spriteSourceHeight: double.tryParse(map['spriteSourceSize']['h'].toString()) ?? 0.0,
      sourceWidth: double.tryParse(map['sourceSize']['w'].toString()) ?? 0.0,
      sourceHeight: double.tryParse(map['sourceSize']['h'].toString()) ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  // ignore: unused_element
  factory TexturePackerFrame.fromJson(String source) =>
      TexturePackerFrame.fromMap(json.decode(source));

  @override
  String toString() {
    return '$TexturePackerFrame(name: $name, x: $x, y: $y, width: $width, height: $height, rotated: $rotated, trimmed: $trimmed, spriteSourceX: $spriteSourceX, spriteSourceY: $spriteSourceY, spriteSourceWidth: $spriteSourceWidth, spriteSourceHeight: $spriteSourceHeight, sourceWidth: $sourceWidth, sourceHeight: $sourceHeight)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TexturePackerFrame &&
        other.name == name &&
        other.x == x &&
        other.y == y &&
        other.width == width &&
        other.height == height &&
        other.rotated == rotated &&
        other.trimmed == trimmed &&
        other.spriteSourceX == spriteSourceX &&
        other.spriteSourceY == spriteSourceY &&
        other.spriteSourceWidth == spriteSourceWidth &&
        other.spriteSourceHeight == spriteSourceHeight &&
        other.sourceWidth == sourceWidth &&
        other.sourceHeight == sourceHeight;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        x.hashCode ^
        y.hashCode ^
        width.hashCode ^
        height.hashCode ^
        rotated.hashCode ^
        trimmed.hashCode ^
        spriteSourceX.hashCode ^
        spriteSourceY.hashCode ^
        spriteSourceWidth.hashCode ^
        spriteSourceHeight.hashCode ^
        sourceWidth.hashCode ^
        sourceHeight.hashCode;
  }
}

class TexturePackerAnimation {
  final String name;
  final List<String> frames;

  static const empty = TexturePackerAnimation();
  bool get isEmpty => identical(this, empty);
  bool get isNotEmpty => !identical(empty, this);

  const TexturePackerAnimation({
    this.name = "",
    this.frames = const [],
  });

  TexturePackerAnimation copyWith({
    String? name,
    List<String>? frames,
  }) {
    return TexturePackerAnimation(
      name: name ?? this.name,
      frames: frames ?? this.frames,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'frames': frames,
    };
  }

  factory TexturePackerAnimation.fromMap(Map<String, dynamic> map) {
    return TexturePackerAnimation(
      name: map['name'] ?? '',
      frames: List<String>.from(map['frames']),
    );
  }

  String toJson() => json.encode(toMap());

  // ignore: unused_element
  factory TexturePackerAnimation.fromJson(String source) =>
      TexturePackerAnimation.fromMap(json.decode(source));

  @override
  String toString() => '$TexturePackerAnimation(name: $name, frames: $frames)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TexturePackerAnimation &&
        other.name == name &&
        ListEquality().equals(other.frames, frames);
  }

  @override
  int get hashCode => name.hashCode ^ frames.hashCode;
}

class TexturePackerMetadata {
  final String app;
  final double version;
  final String image;
  final String format;
  final double imageWidth;
  final double imageHeight;
  final double scale;
  final String smartUpdate;

  static const empty = TexturePackerMetadata();
  bool get isEmpty => identical(this, empty);
  bool get isNotEmpty => !identical(empty, this);
  Vector2 get size => Vector2(imageWidth, imageHeight);

  const TexturePackerMetadata({
    this.app = '',
    this.version = 1.0,
    this.image = '',
    this.format = '',
    this.imageWidth = 1.0,
    this.imageHeight = 1.0,
    this.scale = 1.0,
    this.smartUpdate = '',
  });

  TexturePackerMetadata copyWith({
    String? app,
    double? version,
    String? image,
    String? format,
    double? imageWidth,
    double? imageHeight,
    double? scale,
    String? smartUpdate,
  }) {
    return TexturePackerMetadata(
      app: app ?? this.app,
      version: version ?? this.version,
      image: image ?? this.image,
      format: format ?? this.format,
      imageWidth: imageWidth ?? this.imageWidth,
      imageHeight: imageHeight ?? this.imageHeight,
      scale: scale ?? this.scale,
      smartUpdate: smartUpdate ?? this.smartUpdate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'app': app,
      'version': version,
      'image': image,
      'format': format,
      'imageWidth': imageWidth,
      'imageHeight': imageHeight,
      'scale': scale,
      'smartUpdate': smartUpdate,
    };
  }

  factory TexturePackerMetadata.fromMap(Map<String, dynamic> map) {
    return TexturePackerMetadata(
      app: map['app'] ?? '',
      version: double.tryParse(map['version'].toString()) ?? 0.0,
      image: map['image'] ?? '',
      format: map['format'] ?? '',
      imageWidth: double.tryParse(map['size']['w'].toString()) ?? 0.0,
      imageHeight: double.tryParse(map['size']['h'].toString()) ?? 0.0,
      scale: double.tryParse(map['scale'].toString()) ?? 0.0,
      smartUpdate: map['smartUpdate'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  // ignore: unused_element
  factory TexturePackerMetadata.fromJson(String source) =>
      TexturePackerMetadata.fromMap(json.decode(source));

  @override
  String toString() {
    return '$TexturePackerMetadata(app: $app, version: $version, image: $image, format: $format, imageWidth: $imageWidth, imageHeight: $imageHeight, scale: $scale, smartUpdate: $smartUpdate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TexturePackerMetadata &&
        other.app == app &&
        other.version == version &&
        other.image == image &&
        other.format == format &&
        other.imageWidth == imageWidth &&
        other.imageHeight == imageHeight &&
        other.scale == scale &&
        other.smartUpdate == smartUpdate;
  }

  @override
  int get hashCode {
    return app.hashCode ^
        version.hashCode ^
        image.hashCode ^
        format.hashCode ^
        imageWidth.hashCode ^
        imageHeight.hashCode ^
        scale.hashCode ^
        smartUpdate.hashCode;
  }
}
