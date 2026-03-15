import '../../data/firebase/firebase_auth_service.dart';
import '../models/sign_up_model.dart';
import 'auth_service.dart';

class AuthFirebaseService extends AuthService {
  AuthFirebaseService();

  @override
  Future<String> registerWithEmailAndPassword({
    required SignUpModel model,
  }) async {
    return await FirebaseAuthService.registerWithEmailAndPassword(
      signUpData: model.toDto(),
    );
  }
}
