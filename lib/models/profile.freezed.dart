// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return _Profile.fromJson(json);
}

/// @nodoc
mixin _$Profile {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get birthDate => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String get myNumber => throw _privateConstructorUsedError;
  List<String> get familyNumbers => throw _privateConstructorUsedError;
  String get specialNotes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileCopyWith<Profile> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileCopyWith<$Res> {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) then) =
      _$ProfileCopyWithImpl<$Res, Profile>;
  @useResult
  $Res call(
      {int id,
      String name,
      String birthDate,
      String gender,
      String myNumber,
      List<String> familyNumbers,
      String specialNotes});
}

/// @nodoc
class _$ProfileCopyWithImpl<$Res, $Val extends Profile>
    implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? birthDate = null,
    Object? gender = null,
    Object? myNumber = null,
    Object? familyNumbers = null,
    Object? specialNotes = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: null == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      myNumber: null == myNumber
          ? _value.myNumber
          : myNumber // ignore: cast_nullable_to_non_nullable
              as String,
      familyNumbers: null == familyNumbers
          ? _value.familyNumbers
          : familyNumbers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      specialNotes: null == specialNotes
          ? _value.specialNotes
          : specialNotes // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileImplCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$$ProfileImplCopyWith(
          _$ProfileImpl value, $Res Function(_$ProfileImpl) then) =
      __$$ProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String birthDate,
      String gender,
      String myNumber,
      List<String> familyNumbers,
      String specialNotes});
}

/// @nodoc
class __$$ProfileImplCopyWithImpl<$Res>
    extends _$ProfileCopyWithImpl<$Res, _$ProfileImpl>
    implements _$$ProfileImplCopyWith<$Res> {
  __$$ProfileImplCopyWithImpl(
      _$ProfileImpl _value, $Res Function(_$ProfileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? birthDate = null,
    Object? gender = null,
    Object? myNumber = null,
    Object? familyNumbers = null,
    Object? specialNotes = null,
  }) {
    return _then(_$ProfileImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: null == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      myNumber: null == myNumber
          ? _value.myNumber
          : myNumber // ignore: cast_nullable_to_non_nullable
              as String,
      familyNumbers: null == familyNumbers
          ? _value._familyNumbers
          : familyNumbers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      specialNotes: null == specialNotes
          ? _value.specialNotes
          : specialNotes // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileImpl implements _Profile {
  const _$ProfileImpl(
      {required this.id,
      required this.name,
      required this.birthDate,
      required this.gender,
      required this.myNumber,
      required final List<String> familyNumbers,
      required this.specialNotes})
      : _familyNumbers = familyNumbers;

  factory _$ProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String birthDate;
  @override
  final String gender;
  @override
  final String myNumber;
  final List<String> _familyNumbers;
  @override
  List<String> get familyNumbers {
    if (_familyNumbers is EqualUnmodifiableListView) return _familyNumbers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_familyNumbers);
  }

  @override
  final String specialNotes;

  @override
  String toString() {
    return 'Profile(id: $id, name: $name, birthDate: $birthDate, gender: $gender, myNumber: $myNumber, familyNumbers: $familyNumbers, specialNotes: $specialNotes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.myNumber, myNumber) ||
                other.myNumber == myNumber) &&
            const DeepCollectionEquality()
                .equals(other._familyNumbers, _familyNumbers) &&
            (identical(other.specialNotes, specialNotes) ||
                other.specialNotes == specialNotes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      birthDate,
      gender,
      myNumber,
      const DeepCollectionEquality().hash(_familyNumbers),
      specialNotes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileImplCopyWith<_$ProfileImpl> get copyWith =>
      __$$ProfileImplCopyWithImpl<_$ProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileImplToJson(
      this,
    );
  }
}

abstract class _Profile implements Profile {
  const factory _Profile(
      {required final int id,
      required final String name,
      required final String birthDate,
      required final String gender,
      required final String myNumber,
      required final List<String> familyNumbers,
      required final String specialNotes}) = _$ProfileImpl;

  factory _Profile.fromJson(Map<String, dynamic> json) = _$ProfileImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get birthDate;
  @override
  String get gender;
  @override
  String get myNumber;
  @override
  List<String> get familyNumbers;
  @override
  String get specialNotes;
  @override
  @JsonKey(ignore: true)
  _$$ProfileImplCopyWith<_$ProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
