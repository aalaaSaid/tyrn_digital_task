import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/functions/navigation.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/custom_navigate_button.dart';
import '../../../../core/widgets/nav_bar.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  String otp = '0000';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Verification',
                style: getSubTitleTextStyle(),
              ),
              const Gap(20),
              Text(
                'We’ve send you the verification code\n on +1 2620 0323 7631',
                style: getSmallTextStyle(),
                textAlign: TextAlign.start,
              ),
              const Gap(20),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PinCodeTextField(
                    appContext: context,
                    autoFocus: true,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.number,
                    length: 4,
                    obscureText: false,
                    animationType: AnimationType.scale,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(12),
                      fieldHeight: 55,
                      fieldWidth: 55,
                      borderWidth: .5,
                      activeColor: AppColors.greyColor.withOpacity(.5),
                      inactiveColor: AppColors.greyColor.withOpacity(.5),
                      inactiveFillColor: Colors.white,
                      activeFillColor: AppColors.whiteColor,
                      selectedColor: AppColors.primaryColor,
                      selectedFillColor: Colors.white,
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    backgroundColor: Colors.white,
                    enableActiveFill: true,
                    onCompleted: (value) {
                      if (value == otp) {
                        navigateReplacement(context, const NavBar());
                      }
                    },
                  ),
                ),
              ),
              const Gap(20),
              Center(
                child: CustomNavigationButton(text: 'Continue',
                    height: 58,
                    width: 271,
                    onPressed:(){
                  navigateReplacement(context, const NavBar());
                }),
              ),
              const Gap(20),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Re-send code in",
                    style: getSmallTextStyle(color: AppColors.blackColor),
                    children: [
                      TextSpan(
                        text: "  0:20",
                        style: getSmallTextStyle(color: AppColors.primaryColor),
                      ),
                    ],
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
