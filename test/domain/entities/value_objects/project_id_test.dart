import 'package:flutter_test/flutter_test.dart';
import 'package:chasivnyk/domain/entities/value_objects/task_value_objects.dart';

void main() {
  group('ProjectId', () {
    test('should create valid ProjectId', () {
      final projectId = ProjectId('project-123');
      expect(projectId.value, equals('project-123'));
    });

    test('should trim whitespace', () {
      final projectId = ProjectId('  project-123  ');
      expect(projectId.value, equals('project-123'));
    });

    test('should throw on empty value', () {
      expect(() => ProjectId(''), throwsArgumentError);
      expect(() => ProjectId('  '), throwsArgumentError);
    });

    test('should throw on invalid characters', () {
      expect(() => ProjectId('project@123'), throwsArgumentError);
      expect(() => ProjectId('project 123'), throwsArgumentError);
      expect(() => ProjectId('project#123'), throwsArgumentError);
    });

    test('should generate valid UUID', () {
      final projectId = ProjectId.generate();
      expect(projectId.value, matches(RegExp(r'^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$')));
    });

    test('should serialize and deserialize', () {
      final projectId = ProjectId('project-123');
      final json = projectId.toJson();
      final deserialized = ProjectId.fromJson(json);
      expect(deserialized, equals(projectId));
    });

    test('should implement toString', () {
      final projectId = ProjectId('project-123');
      expect(projectId.toString(), equals('project-123'));
    });

    test('should implement equality', () {
      final id1 = ProjectId('project-123');
      final id2 = ProjectId('project-123');
      final id3 = ProjectId('project-456');

      expect(id1, equals(id2));
      expect(id1, isNot(equals(id3)));
      expect(id1.hashCode, equals(id2.hashCode));
      expect(id1.hashCode, isNot(equals(id3.hashCode)));
    });
  });
}
