import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/sign_up_model.dart';

part 'sign_up_dto.freezed.dart';
part 'sign_up_dto.g.dart';

@freezed
abstract class SignUpDto with _$SignUpDto {
  const SignUpDto._();

  const factory SignUpDto({
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
}
