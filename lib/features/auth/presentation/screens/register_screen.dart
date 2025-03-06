import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:task_turn_digital/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:task_turn_digital/features/auth/presentation/screens/verification_screen.dart';

import '../../../../core/functions/dialogs.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/functions/validation.dart';
import '../../../../core/services/local/local_storge.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/custom_navigate_button.dart';
import '../bloc/auth_events.dart';
import '../bloc/auth_states.dart';
import '../bloc/auth_states.dart';
import '../widgets/custom_social_button.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool obscureText1 = true;
  bool obscureText2 = true;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
  listener: (context, state) {
   if(state is RegisterLoadingState){
     showLoadingDialog(context);
   }else if(state is RegisterErrorState){
     Navigator.pop(context);
     showErrorDialog(context, state.error);
   }else if (state is RegisterSuccessState){
     LocalStorage.cacheData(LocalStorage.isLogin, true);
     Navigator.pop(context);
     navigateReplacement(context, const VerificationScreen());
   }
  },
  child: Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, right: 30,left: 30),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Sign Up', style: getSubTitleTextStyle(),),
                const Gap(10),
                TextFormField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  controller: nameController,
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Please enter your name';
                    }else if (!isValidName(value)){
                      return 'Enter at least 3 words separated by spaces';
                    }
                    return null ;
                  },
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person_2_outlined),
                      hintText: 'Full Name'
                  ),
                ),
                const Gap(15),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  controller: emailController,
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Please enter your email';
                    }else if (!isValidEmail(value)){
                      return 'Please enter a valid email';
                    }
                    return null ;
                  },
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      hintText: 'abc@gmail.com'
                  ),
                ),
                const Gap(15),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                  controller: passwordController,
                  obscureText: obscureText1,
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Please enter your password';
                    }else if (!isValidPassword(value)){
                      return 'Password must be at least 8 characters, include uppercase, lowercase, number, and special character.';
                    }
                    return null ;
                  },
                  decoration: InputDecoration(
                      hintText: 'Your Password',
                      prefixIcon: const Icon(Icons.lock_outline_rounded),
                      suffixIcon:IconButton(onPressed: (){
                        obscureText1 = !obscureText1;
                        setState(() {});
                      }, icon: obscureText1 ? const Icon(Icons.visibility_off):const Icon(Icons.visibility_rounded),),

                  ),
                ),
                const Gap(15),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  controller: confirmPasswordController,
                  obscureText: obscureText2,
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Please enter your password';
                    }else if (value != passwordController.text){
                      return 'Passwords do not match';
                    }
                    return null ;
                  },
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    prefixIcon: const Icon(Icons.lock_outline_rounded),
                    suffixIcon:IconButton(onPressed: (){
                      obscureText2 = !obscureText2;
                      setState(() {});
                    }, icon: obscureText2 ? const Icon(Icons.visibility_off):const Icon(Icons.visibility_rounded),),

                  ),
                ),
                const Gap(20),
                Center(
                  child: CustomNavigationButton(
                      width: 271,
                      height: 58,
                      text: 'SIGN UP', onPressed: (){
                        if(_formKey.currentState!.validate()){
                          context.read<AuthBloc>().add(
                            RegisterEvent(
                                name: nameController.text,
                                email: emailController.text,
                                password: passwordController.text)
                          );

                        }
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
                        text: "Already have an account?",
                        style: getSmallTextStyle(color: AppColors.blackColor),
                        children: [
                          TextSpan(
                            text: "SignIn",
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
      ),
    ),
);
  }
}
