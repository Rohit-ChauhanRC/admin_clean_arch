import 'package:admin_clean_arch/di_container.dart';
import 'package:admin_clean_arch/features/auth/domain/usecases/login_user_case.dart';
import 'package:admin_clean_arch/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:admin_clean_arch/features/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Setting up getId
  setupDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc(loginUserCase: sl()),

      child: MaterialApp(
        title: 'Admin',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: LoginPage(),
        // routes: {"/": (_) => LoginPage()},
      ),
    );
  }
}
