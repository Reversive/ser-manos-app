import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum()
enum Gender {
  male("Hombre"),
  female("Mujer"),
  nonBinary("No binario");

  final String value;
  const Gender(this.value);

  String getGenderEnumType() {
    switch (value) {
      case "Hombre":
        return "male";
      case "Mujer":
        return "female";
      case "No binario":
        return "nonBinary";
      default:
        return "male";
    }
  }
}
