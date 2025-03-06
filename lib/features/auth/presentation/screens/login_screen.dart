import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task_turn_digital/features/auth/presentation/screens/register_screen.dart';

import '../../../../core/functions/navigation.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/custom_navigate_button.dart';
import '../widgets/custom_social_button.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isRemember = true ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 87, right: 32,left: 32),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/logo.png'),
              const Gap(30),
              Text('Sign in', style: getSubTitleTextStyle(),),
              const Gap(10),
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  hintText: 'abc@gmail.com'
                ),
              ),
              const Gap(15),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Your Password',
                  prefixIcon: Icon(Icons.lock_outline_rounded),
                  suffixIcon: Icon(Icons.visibility_off)
                ),
              ),
              const Gap(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Switch(
                          value: isRemember,
                          activeColor: AppColors.whiteColor,
                          activeTrackColor: AppColors.primaryColor,
                          inactiveThumbColor: AppColors.greyColor,
                          inactiveTrackColor: AppColors.whiteColor,
                          onChanged: (value){
                        isRemember = value;
                        setState(() {});
                      }),
                      const Gap(5),
                      Text('Remember me', style: getSmallTextStyle(),)
                    ],
                  ),
                  Text('Forgot Password?', style: getSmallTextStyle(),)
                ],
              ),
              const Gap(20),
              Center(
                child: CustomNavigationButton(
                    width: 271,
                    height: 58,
                    text: 'Sign In', onPressed: (){
                  navigateTO(context, const RegisterScreen());
                }),
              ),
              const Gap(20),
              Center(child: Text('OR', style: getBodyTextStyle(color: AppColors.greyColor),)),
              const Gap(10),
              const CustomSocialButton(text: 'Login With Google', logo: 'assets/icons/google.svg'),
              const Gap(20),
              const CustomSocialButton(text: 'Login With Facebook', logo: 'assets/icons/facebook.svg'),
              const Gap(20),
              Center(
                child: InkWell(
                  onTap: (){
                    navigateTO(context, const RegisterScreen());
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "Don’t have an account? ",
                      style: getSmallTextStyle(color: AppColors.blackColor),
                      children: [
                        TextSpan(
                          text: "Sign up",
                          style: getSmallTextStyle(color: AppColors.primaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
