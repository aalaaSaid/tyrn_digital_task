import 'package:flutter/material.dart';
import 'package:task_turn_digital/core/functions/navigation.dart';
import 'package:task_turn_digital/core/services/local/local_storge.dart';
import 'package:task_turn_digital/features/auth/presentation/screens/register_screen.dart';
import 'package:task_turn_digital/core/widgets/nav_bar.dart';
import 'onboarding/screen/onboarding_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
      Future.delayed(const Duration(seconds: 3),()async{
        bool isOnboardingShow= await LocalStorage.getData(LocalStorage.onboarding)??false;
        bool isLogin= await LocalStorage.getData(LocalStorage.isLogin)??false;
        if(!isOnboardingShow){
          navigateReplacement(context, const OnboardingScreen());
        }else if (!isLogin){
          navigateReplacement(context, const RegisterScreen());
        }else{
          navigateReplacement(context, const NavBar());
        }
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/logo.png'),
      ),
    );
  }
}
