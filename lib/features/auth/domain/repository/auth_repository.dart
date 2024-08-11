import 'package:blog_app_flutter/shared/error/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> signUpWithEmailPassword({
    required String email,
    required String name,
    required String password,
  });
  Future<Either<Failure, String>> signInWithEmailPassword({
    required String email,
    required String password,
  });
}
