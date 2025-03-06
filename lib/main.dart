import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_turn_digital/core/services/local/local_storge.dart';
import 'package:task_turn_digital/core/utils/app_themes.dart';
import 'package:task_turn_digital/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:task_turn_digital/features/home/presentation/bloc/home_bloc.dart';
import 'package:task_turn_digital/features/intro_screens/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context)=>HomeBloc()),
      ],
      child: MaterialApp(
        theme: AppThemes.themeData,
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
