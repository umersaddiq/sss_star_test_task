import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../local_data/drift/data_source/user_data_source.dart';
import '../../../../local_data/preferences/preferences_service.dart';
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
      final user = await ref
          .read(authServiceProvider)
          .registerWithEmailAndPassword(model: model);
      await ref.read(studentDbSourceProvider).upsertUser(model.toDto());
      await ref.read(preferencesServiceProvider).saveSignIn(true);
      return user;
    });
    return state.value ?? '';
  }
}
