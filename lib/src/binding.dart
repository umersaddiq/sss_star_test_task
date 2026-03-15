import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SSSStarTestTaskBinding {
  SSSStarTestTaskBinding() : assert(_instance == null) {
    initInstance();
  }

  static SSSStarTestTaskBinding get instance => checkInstance(_instance);
  static SSSStarTestTaskBinding? _instance;

  @protected
  @mustCallSuper
  void initInstance() => _instance = this;

  static T checkInstance<T extends SSSStarTestTaskBinding>(T? instance) {
    assert(() {
      if (instance == null) {
        throw FlutterError.fromParts([
          ErrorSummary('QuizLearningApp binding has not yet been initialized.'),
          ErrorHint(
            'In the app, this is done by the `AppSSSStarTestTaskBinding.ensureInitialized()` call '
            'in the `void main()` method.',
          ),
          ErrorHint(
            'In a test, one can call `TestQuizLearningAppBinding.ensureInitialized()` as the '
            "first line in the test's `main()` method to initialize the binding.",
          ),
        ]);
      }
      return true;
    }());
    return instance!;
  }

  SharedPreferences get sharedPreferences;
}

class AppSSSStarTestTaskBinding extends SSSStarTestTaskBinding {
  AppSSSStarTestTaskBinding();

  factory AppSSSStarTestTaskBinding.ensureInitialized() {
    if (SSSStarTestTaskBinding._instance == null) {
      AppSSSStarTestTaskBinding();
    }
    return SSSStarTestTaskBinding.instance as AppSSSStarTestTaskBinding;
  }

  SharedPreferences? _preferences;

  @override
  SharedPreferences get sharedPreferences {
    if (_preferences == null) {
      throw FlutterError.fromParts([
        ErrorSummary('Shared preferences have not yet been preloaded.'),
        ErrorHint(
          'In the app, this is done by the `await AppSSSStarTestTaskBinding.preloadSharedPreferences()` call '
          'in the `Future<void> main()` method.',
        ),
        ErrorHint(
          'In a test, one can call `TestSSSStarTestTaskBinding.setInitialSharedPreferencesValues({})` as the '
          "first line in the test's `main()` method.",
        ),
      ]);
    }
    return _preferences!;
  }

  Future<void> loadSharedPreferences() async {
    _preferences = await SharedPreferences.getInstance();
  }
}
