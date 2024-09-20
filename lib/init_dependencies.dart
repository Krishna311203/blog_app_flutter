import 'package:blog_app_flutter/features/auth/data/dataSource/auth_remote_data_source.dart';
import 'package:blog_app_flutter/features/auth/data/repository/auth_repository_impl.dart';
import 'package:blog_app_flutter/features/auth/domain/repository/auth_repository.dart';
import 'package:blog_app_flutter/features/auth/domain/usecases/user_sign_up.dart';
import 'package:blog_app_flutter/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:blog_app_flutter/shared/secrets/app_secrets.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  final supabase = await Supabase.initialize(
      url: AppSecrets.supabaseUrl, anonKey: AppSecrets.supabaseKey);
  serviceLocator.registerLazySingleton(() => supabase.client);
}

void _initAuth() {
  serviceLocator.registerFactory<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => UserSignUp(
      serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<AuthBloc>(() => AuthBloc(
        userSignUp: serviceLocator(),
      ));
}
