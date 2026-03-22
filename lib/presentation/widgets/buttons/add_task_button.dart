import 'package:flutter/material.dart';

import '../../../core/constants/ui_constants.dart';
import 'primary_fab.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({
    super.key,
    required this.onPressed,
    this.icon = Icons.add,
    this.heroTag,
    this.bottomPadding = UIConstants.fabDefaultBottomPadding,
  });

  final VoidCallback onPressed;
  final IconData icon;
  final Object? heroTag;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: PrimaryFab(
        onPressed: onPressed,
        icon: icon,
        heroTag: heroTag,
      ),
    );
  }
}
