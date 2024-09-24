// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'volunteering.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Volunteering _$VolunteeringFromJson(Map<String, dynamic> json) {
  return _Volunteering.fromJson(json);
}

/// @nodoc
mixin _$Volunteering {
  int? get id => throw _privateConstructorUsedError;
  String get about => throw _privateConstructorUsedError;
  List<String> get availability => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  Location get location => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get purpose => throw _privateConstructorUsedError;
  List<String> get requirements => throw _privateConstructorUsedError;
  int get vacancies => throw _privateConstructorUsedError;

  /// Serializes this Volunteering to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Volunteering
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VolunteeringCopyWith<Volunteering> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VolunteeringCopyWith<$Res> {
  factory $VolunteeringCopyWith(
          Volunteering value, $Res Function(Volunteering) then) =
      _$VolunteeringCopyWithImpl<$Res, Volunteering>;
  @useResult
  $Res call(
      {int? id,
      String about,
      List<String> availability,
      String imageUrl,
      Location location,
      String name,
      String purpose,
      List<String> requirements,
      int vacancies});

  $LocationCopyWith<$Res> get location;
}

/// @nodoc
class _$VolunteeringCopyWithImpl<$Res, $Val extends Volunteering>
    implements $VolunteeringCopyWith<$Res> {
  _$VolunteeringCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Volunteering
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? about = null,
    Object? availability = null,
    Object? imageUrl = null,
    Object? location = null,
    Object? name = null,
    Object? purpose = null,
    Object? requirements = null,
    Object? vacancies = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      about: null == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String,
      availability: null == availability
          ? _value.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as List<String>,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      purpose: null == purpose
          ? _value.purpose
          : purpose // ignore: cast_nullable_to_non_nullable
              as String,
      requirements: null == requirements
          ? _value.requirements
          : requirements // ignore: cast_nullable_to_non_nullable
              as List<String>,
      vacancies: null == vacancies
          ? _value.vacancies
          : vacancies // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of Volunteering
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res> get location {
    return $LocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VolunteeringImplCopyWith<$Res>
    implements $VolunteeringCopyWith<$Res> {
  factory _$$VolunteeringImplCopyWith(
          _$VolunteeringImpl value, $Res Function(_$VolunteeringImpl) then) =
      __$$VolunteeringImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String about,
      List<String> availability,
      String imageUrl,
      Location location,
      String name,
      String purpose,
      List<String> requirements,
      int vacancies});

  @override
  $LocationCopyWith<$Res> get location;
}

/// @nodoc
class __$$VolunteeringImplCopyWithImpl<$Res>
    extends _$VolunteeringCopyWithImpl<$Res, _$VolunteeringImpl>
    implements _$$VolunteeringImplCopyWith<$Res> {
  __$$VolunteeringImplCopyWithImpl(
      _$VolunteeringImpl _value, $Res Function(_$VolunteeringImpl) _then)
      : super(_value, _then);

  /// Create a copy of Volunteering
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? about = null,
    Object? availability = null,
    Object? imageUrl = null,
    Object? location = null,
    Object? name = null,
    Object? purpose = null,
    Object? requirements = null,
    Object? vacancies = null,
  }) {
    return _then(_$VolunteeringImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      about: null == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String,
      availability: null == availability
          ? _value._availability
          : availability // ignore: cast_nullable_to_non_nullable
              as List<String>,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      purpose: null == purpose
          ? _value.purpose
          : purpose // ignore: cast_nullable_to_non_nullable
              as String,
      requirements: null == requirements
          ? _value._requirements
          : requirements // ignore: cast_nullable_to_non_nullable
              as List<String>,
      vacancies: null == vacancies
          ? _value.vacancies
          : vacancies // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VolunteeringImpl implements _Volunteering {
  const _$VolunteeringImpl(
      {required this.id,
      required this.about,
      required final List<String> availability,
      required this.imageUrl,
      required this.location,
      required this.name,
      required this.purpose,
      required final List<String> requirements,
      required this.vacancies})
      : _availability = availability,
        _requirements = requirements;

  factory _$VolunteeringImpl.fromJson(Map<String, dynamic> json) =>
      _$$VolunteeringImplFromJson(json);

  @override
  final int? id;
  @override
  final String about;
  final List<String> _availability;
  @override
  List<String> get availability {
    if (_availability is EqualUnmodifiableListView) return _availability;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availability);
  }

  @override
  final String imageUrl;
  @override
  final Location location;
  @override
  final String name;
  @override
  final String purpose;
  final List<String> _requirements;
  @override
  List<String> get requirements {
    if (_requirements is EqualUnmodifiableListView) return _requirements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_requirements);
  }

  @override
  final int vacancies;

  @override
  String toString() {
    return 'Volunteering(id: $id, about: $about, availability: $availability, imageUrl: $imageUrl, location: $location, name: $name, purpose: $purpose, requirements: $requirements, vacancies: $vacancies)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VolunteeringImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.about, about) || other.about == about) &&
            const DeepCollectionEquality()
                .equals(other._availability, _availability) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.purpose, purpose) || other.purpose == purpose) &&
            const DeepCollectionEquality()
                .equals(other._requirements, _requirements) &&
            (identical(other.vacancies, vacancies) ||
                other.vacancies == vacancies));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      about,
      const DeepCollectionEquality().hash(_availability),
      imageUrl,
      location,
      name,
      purpose,
      const DeepCollectionEquality().hash(_requirements),
      vacancies);

  /// Create a copy of Volunteering
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VolunteeringImplCopyWith<_$VolunteeringImpl> get copyWith =>
      __$$VolunteeringImplCopyWithImpl<_$VolunteeringImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VolunteeringImplToJson(
      this,
    );
  }
}

abstract class _Volunteering implements Volunteering {
  const factory _Volunteering(
      {required final int? id,
      required final String about,
      required final List<String> availability,
      required final String imageUrl,
      required final Location location,
      required final String name,
      required final String purpose,
      required final List<String> requirements,
      required final int vacancies}) = _$VolunteeringImpl;

  factory _Volunteering.fromJson(Map<String, dynamic> json) =
      _$VolunteeringImpl.fromJson;

  @override
  int? get id;
  @override
  String get about;
  @override
  List<String> get availability;
  @override
  String get imageUrl;
  @override
  Location get location;
  @override
  String get name;
  @override
  String get purpose;
  @override
  List<String> get requirements;
  @override
  int get vacancies;

  /// Create a copy of Volunteering
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VolunteeringImplCopyWith<_$VolunteeringImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
