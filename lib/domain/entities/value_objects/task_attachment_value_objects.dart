import 'package:uuid/uuid.dart';

class AttachmentId {
  final String value;

  AttachmentId._(this.value);

  factory AttachmentId() {
    return AttachmentId._(const Uuid().v4());
  }

  factory AttachmentId.fromString(String value) {
    return AttachmentId._(value);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AttachmentId &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class AttachmentFilename {
  final String value;

  AttachmentFilename._(this.value);

  factory AttachmentFilename(String value) {
    if (value.trim().isEmpty) {
      throw ArgumentError('Filename cannot be empty');
    }
    return AttachmentFilename._(value);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AttachmentFilename &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

enum AttachmentType {
  file,
  link,
  image,
  document,
  audio,
  video,
  other
}

class AttachmentPath {
  final String value;

  AttachmentPath._(this.value);

  factory AttachmentPath(String value) {
    if (value.trim().isEmpty) {
      throw ArgumentError('Path cannot be empty');
    }
    return AttachmentPath._(value);
  }

  factory AttachmentPath.url(String url) {
    if (url.trim().isEmpty) {
      throw ArgumentError('URL cannot be empty');
    }
    
    // Basic URL validation
    final uri = Uri.tryParse(url);
    if (uri == null || (!uri.hasScheme || (uri.scheme != 'http' && uri.scheme != 'https'))) {
      throw ArgumentError('Invalid URL format. Must be a valid HTTP or HTTPS URL');
    }
    
    return AttachmentPath._(url);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AttachmentPath &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class AttachmentSize {
  final int value;

  AttachmentSize._(this.value);

  factory AttachmentSize(int value) {
    if (value < 0) {
      throw ArgumentError('Size cannot be negative');
    }
    return AttachmentSize._(value);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AttachmentSize &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value.toString();
}
