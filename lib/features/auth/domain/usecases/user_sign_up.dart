import 'package:blog_app_flutter/features/auth/domain/repository/auth_repository.dart';
import 'package:blog_app_flutter/shared/error/failures.dart';
import 'package:blog_app_flutter/shared/usercase/usecase.dart';
import 'package:fpdart/fpdart.dart';

class UserSignUp implements UseCase<String, UserSignUpParams> {
  final AuthRepository authRepository;

  UserSignUp(this.authRepository);

  @override
  Future<Either<Failure, String>> call(UserSignUpParams params) async {
    return await authRepository.signUpWithEmailPassword(
      email: params.email,
      name: params.name,
      password: params.password,
    );
  }
}

// class for signup params
class UserSignUpParams {
  final String name;
  final String password;
  final String email;

  UserSignUpParams({
    required this.name,
    required this.password,
    required this.email,
  });
}
