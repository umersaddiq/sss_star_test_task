import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/dto/sign_up_dto.dart';

part 'sign_up_model.freezed.dart';

@freezed
abstract class SignUpModel with _$SignUpModel {
  const SignUpModel._();

  const factory SignUpModel({
    required String email,
    required String username,
    required String birthday,
    required String password,
  }) = _SignUpModel;

  SignUpDto toDto() {
    return SignUpDto(
      email: email,
      username: username,
      birthday: birthday,
      password: password,
    );
  }
}
