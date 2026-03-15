import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/sign_up_model.dart';
import '../services/auth_service.dart';

part 'sign_up_with_email_and_password_provider.g.dart';

@riverpod
class SignUpWithEmailAndPassword extends _$SignUpWithEmailAndPassword {
  @override
  AsyncValue<String> build() {
    return const AsyncValue.data('');
  }

  Future<String> signUpWithEmailAndPassword({
    required SignUpModel model,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return await ref
          .read(authServiceProvider)
          .registerWithEmailAndPassword(model: model);
    });
    return state.value ?? '';
  }
}
