import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:task_turn_digital/core/functions/navigation.dart';
import 'package:task_turn_digital/core/utils/app_colors.dart';
import 'package:task_turn_digital/core/utils/text_styles.dart';
import 'package:task_turn_digital/features/auth/presentation/screens/login_screen.dart';

import '../../../../core/services/local/local_storge.dart';
import '../model/onboarding_model.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  var pageController = PageController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                itemCount: onboardingPages.length,
                controller: pageController,
                onPageChanged: (value) {
                  currentPage = value;
                  setState(() {});
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 63),
                    child: Column(
                      children: [
                        Image.asset(
                          '${onboardingPages[index].image}',
                          fit: BoxFit.fill,
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(40),
                            decoration: const BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(48),
                                  topRight: Radius.circular(48),
                                )),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '${onboardingPages[index].title}',
                                  style: getBodyTextStyle(
                                    color: AppColors.whiteColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const Gap(20),
                                Text(
                                  '${onboardingPages[index].subtitle}',
                                  style: getSmallTextStyle(
                                      color: AppColors.whiteColor),
                                  textAlign: TextAlign.center,
                                ),
                                const Spacer(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        LocalStorage.cacheData(LocalStorage.onboarding,true);
                                        navigateReplacement(
                                            context, const LoginScreen());
                                      },
                                      child: Text(
                                        'Skip',
                                        style: getSmallTextStyle(
                                            color: currentPage != 2
                                                ? AppColors.whiteColor
                                                    .withOpacity(.5)
                                                : AppColors.whiteColor),
                                      ),
                                    ),
                                    SmoothPageIndicator(
                                      controller: pageController,
                                      count: 3,
                                      effect: ColorTransitionEffect(
                                        activeDotColor: AppColors.whiteColor,
                                        dotColor: AppColors.whiteColor
                                            .withOpacity(0.5),
                                        dotHeight: 8,
                                        dotWidth: 8,
                                      ),
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          if (currentPage < onboardingPages.length - 1) {
                                            pageController.nextPage(
                                              duration: const Duration(milliseconds: 600),
                                              curve: Curves.easeInOut,
                                            );
                                          } else {
                                            LocalStorage.cacheData(LocalStorage.onboarding,true);
                                            navigateReplacement(context, const LoginScreen());
                                          }
                                        },
                                        child: Text(
                                          'Next',
                                          style: getSmallTextStyle(
                                            color: AppColors.whiteColor,
                                          ),
                                        ))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
