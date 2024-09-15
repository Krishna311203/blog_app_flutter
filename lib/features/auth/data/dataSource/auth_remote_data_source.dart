import 'package:blog_app_flutter/shared/error/exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
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

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;
  AuthRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<String> signUpWithEmailPassword(
      {required String email,
      required String password,
      required String name}) async {
    try {
      var response = await supabaseClient.auth
          .signUp(email: email, password: password, data: {'name': name});
      if (response.user != null) {
        throw const ServerException('User is null');
      } else {
        return response.user!.id;
      }
    } catch (error) {
      throw ServerException(error.toString());
    }
  }

  @override
  Future<String> signInWithEmailPassword(
      {required String email, required String password}) async {
    try {
      var response = await supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (response == null) {
        throw const ServerException('Sign in failed');
      } else {
        return response.user!.id;
      }
    } catch (error) {
      throw ServerException(error.toString());
    }
  }
}
