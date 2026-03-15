part of 'router.dart';

abstract class Redirection {
  static FutureOr<String?> redirect(
    BuildContext _,
    GoRouterState state,
    Ref ref,
  ) async {
    final preferencesService = ref.read(preferencesServiceProvider);
    final isSignedIn = preferencesService.isSignIn;
    final fullPath = state.fullPath;
    final isPublicRoute =
        fullPath == SignInPage.path || fullPath == SignUpPage.path;
    if (!isSignedIn) {
      if (isPublicRoute) return null;
      return SignInPage.path;
    }
    if (isPublicRoute) return HomePage.path;
    return null;
  }
}
