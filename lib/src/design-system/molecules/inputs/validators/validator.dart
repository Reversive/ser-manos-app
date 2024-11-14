import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SMValidator {
  static String? required(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.requiredField;
    }
    return null;
  }

  static String? email(String? value, BuildContext context) {
    final requiredError = required(value, context);
    if (requiredError != null) {
      return requiredError;
    }
    if (!value!.contains('@')) {
      return AppLocalizations.of(context)!.invalidEmail;
    }
    return null;
  }

  static String? password(String? value, BuildContext context) {
    final requiredError = required(value, context);
    if (requiredError != null) {
      return requiredError;
    }
    if (value!.length < 8) {
      return AppLocalizations.of(context)!.invalidPassword;
    }
    return null;
  }
}
