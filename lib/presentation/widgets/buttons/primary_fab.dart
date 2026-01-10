import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class PrimaryFab extends StatelessWidget {
  const PrimaryFab({
    super.key,
    required this.onPressed,
    this.icon = Icons.add,
    this.heroTag,
  });

  final VoidCallback onPressed;
  final IconData icon;
  final Object? heroTag;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: heroTag,
      onPressed: onPressed,
      backgroundColor: AppColors.primaryColor,
      child: Icon(
        icon,
        color: Colors.white,
        size: 28,
      ),
    );
  }
}
