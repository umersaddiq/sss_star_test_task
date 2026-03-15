import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../firebase_options.dart';
import '../../../../binding.dart';
import 'state/app_startup_state.dart';

part 'app_startup_provider.g.dart';

@Riverpod(keepAlive: true)
class AppStartup extends _$AppStartup {
  @override
  Future<AppStartupState> build() async {
    await Future.wait([
      SystemChrome.setPreferredOrientations([.portraitUp, .portraitDown]),
    ]);
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    return AppStartupState(
      sharedPreferences: SSSStarTestTaskBinding.instance.sharedPreferences,
    );
  }
}
