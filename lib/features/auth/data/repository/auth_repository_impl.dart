import 'package:blog_app_flutter/features/auth/data/dataSource/auth_remote_data_source.dart';
import 'package:blog_app_flutter/features/auth/domain/repository/auth_repository.dart';
import 'package:blog_app_flutter/shared/error/exceptions.dart';
import 'package:blog_app_flutter/shared/error/failures.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource RemoteDataSource;
  AuthRepositoryImpl(this.RemoteDataSource);

  @override
  Future<Either<Failure, String>> signInWithEmailPassword(
      {required String email, required String password}) {
    // TODO: implement signInWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUpWithEmailPassword(
      {required String email,
      required String name,
      required String password}) async {
    try {
      final userId = await RemoteDataSource.signUpWithEmailPassword(
          email: email, password: password, name: name);
      return right(userId);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
