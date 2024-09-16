import 'package:blog_app_flutter/features/auth/data/dataSource/auth_remote_data_source.dart';
import 'package:blog_app_flutter/features/auth/data/repository/auth_repository_impl.dart';
import 'package:blog_app_flutter/features/auth/domain/usecases/user_sign_up.dart';
import 'package:blog_app_flutter/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:blog_app_flutter/shared/secrets/app_secrets.dart';
import 'package:blog_app_flutter/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'features/auth/presentation/pages/sign_in_Page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final supabase = await Supabase.initialize(
      url: AppSecrets.supabaseUrl, anonKey: AppSecrets.supabaseKey);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => AuthBloc(
                userSignUp: UserSignUp(AuthRepositoryImpl(
                    AuthRemoteDataSourceImpl(supabase.client)))))
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.darkThemeMode,
      home: const SignInPage(),
    );
  }
}
