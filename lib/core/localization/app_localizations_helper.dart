import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';

class Localization {
  static late AppLocalizations _instance;

  static void initialize(BuildContext context) {
    _instance = AppLocalizations.of(context)!;
  }

  static AppLocalizations get current => _instance;
}
