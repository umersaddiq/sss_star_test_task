import 'package:drift/drift.dart' hide JsonKey;
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/sign_up_model.dart';
import '../../../../local_data/drift/app_database.dart' as db;

part 'sign_up_dto.freezed.dart';
part 'sign_up_dto.g.dart';

@freezed
abstract class SignUpDto with _$SignUpDto {
  const SignUpDto._();

  const factory SignUpDto({
    @JsonKey() final int? id,
    @JsonKey() final DateTime? createdAt,
    required String email,
    required String username,
    required String birthday,
    required String password,
  }) = _SignUpDto;

  factory SignUpDto.fromJson(Map<String, dynamic> json) =>
      _$SignUpDtoFromJson(json);

  SignUpModel toModel() {
    return SignUpModel(
      email: email,
      username: username,
      birthday: birthday,
      password: password,
    );
  }

  db.SignUpSchemaCompanion toSchema() {
    return db.SignUpSchemaCompanion(
      id: id == null ? Value.absent() : Value(id!),
      createdAt: createdAt == null ? Value.absent() : Value(createdAt!),
      email: Value(email),
      username: Value(username),
      birthday: Value(birthday),
      password: Value(password),
    );
  }
}
