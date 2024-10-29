import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ser_manos/src/features/profile/models/gender.dart';

part 'generated/user.freezed.dart';
part 'generated/user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String uuid,
    required String name,
    required String surname,
    @Default(false) bool completed,
    String? email,
    String? image,
    String? phone,
    String? birthdate,
    Gender? gender,
    required List<String> favoriteVolunteerings,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
