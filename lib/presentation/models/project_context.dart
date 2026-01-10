import 'package:flutter/material.dart';

class ProjectContext {
  final String id;
  final String title;
  final Color? accentColor;

  const ProjectContext({
    required this.id,
    required this.title,
    this.accentColor,
  });
}
