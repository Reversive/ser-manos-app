class SMValidator {
  static String? required(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo requerido';
    }
    return null;
  }

  static String? email(String? value) {
    final requiredError = required(value);
    if (requiredError != null) {
      return requiredError;
    }
    if (!value!.contains('@')) {
      return 'Email no válido';
    }
    return null;
  }

  static String? password(String? value) {
    final requiredError = required(value);
    if (requiredError != null) {
      return requiredError;
    }
    if (value!.length < 8) {
      return 'La contraseña debe tener al menos 8 caracteres';
    }
    return null;
  }
}
