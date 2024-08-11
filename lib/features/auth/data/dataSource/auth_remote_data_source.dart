abstract interface class AuthRemoteSource {
  Future<String> signUpWithEmailPassword({
    required String email,
    required String password,
    required String name,
  });
  Future<String> signInWithEmailPassword({
    required String email,
    required String password,
  });
}
