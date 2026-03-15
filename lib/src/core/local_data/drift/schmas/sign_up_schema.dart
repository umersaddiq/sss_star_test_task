import 'package:drift/drift.dart';

import '../mixins/table_mixin.dart';

class SignUpSchema extends Table with TableMixin {
  TextColumn get email => text()();
  TextColumn get username => text()();
  TextColumn get birthday => text()();
  TextColumn get password => text()();
}
