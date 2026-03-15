import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../features/auth/data/dto/sign_up_dto.dart';
import '../app_database.dart';

part 'user_data_source.g.dart';

class StudentDbSource {
  final AppDatabase database;

  StudentDbSource(this.database);

  Future<int> upsertUser(SignUpDto user) async {
    try {
      final existingUser = await getUserByEmail(user.email);

      if (existingUser != null) {
        final success = await updateUserByEmail(user);
        return success > 0 ? existingUser.id! : -1;
      }

      return await database.into(database.signUpSchema).insert(user.toSchema());
    } catch (_) {
      rethrow;
    }
  }

  Future<int> updateUserByEmail(SignUpDto user) async {
    try {
      final success =
          await (database.update(database.signUpSchema)
                ..where((t) => t.email.equals(user.email.toLowerCase())))
              .write(user.toSchema());
      return success > 0 ? user.id! : -1;
    } catch (_) {
      rethrow;
    }
  }

  Future<SignUpDto?> getUserByEmail(String email) async {
    final user =
        await (database.select(database.signUpSchema)..where((s) {
              return s.email.equals(email.toLowerCase());
            }))
            .getSingleOrNull();
    return user?.toDto();
  }

  Stream<List<SignUpDto>> getUsers() {
    try {
      return (database.select(
        database.signUpSchema,
      )).watch().map((students) => students.map((s) => s.toDto()).toList());
    } catch (_) {
      rethrow;
    }
  }
}

extension StudentDTOConverter on SignUpSchemaData {
  SignUpDto toDto() {
    return SignUpDto(
      id: id,
      createdAt: createdAt,
      email: email,
      username: username,
      birthday: birthday,
      password: password,
    );
  }
}

@riverpod
StudentDbSource studentDbSource(Ref ref) {
  return StudentDbSource(ref.read(appDatabaseProvider));
}
