import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:task_turn_digital/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:task_turn_digital/features/auth/presentation/bloc/auth_states.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';
import 'custom_row_drawer.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        var userName = context.read<AuthBloc>().userModel?.data?.name;
        return Drawer(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DrawerHeader(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          radius: 30,
                          backgroundColor: AppColors.primaryColor,
                          child: Icon(
                            Icons.person,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        const Gap(10),
                        Text(
                          userName??'User Name',
                          style: getBodyTextStyle(fontSize: 19),
                        )
                      ],
                    )),
                const CustomRowDrawer(
                    text: 'My Profile', icon: Icons.person_2_outlined),
                const CustomRowDrawer(
                    text: 'Massage', icon: Icons.message_outlined),
                const CustomRowDrawer(
                    text: 'Calender', icon: Icons.calendar_month),
                const CustomRowDrawer(
                    text: 'Bookmark', icon: Icons.bookmark_border_outlined),
                const CustomRowDrawer(
                    text: 'Contact Us', icon: Icons.email_outlined),
                const CustomRowDrawer(
                    text: 'Settings', icon: Icons.settings_outlined),
                const CustomRowDrawer(
                    text: 'Helps & FAQs', icon: Icons.question_mark),
                const CustomRowDrawer(
                    text: 'Logout', icon: Icons.logout_outlined),
                const Spacer(),
                Container(
                  height: 46,
                  width: 150,
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(8),

                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(Icons.ac_unit, color: AppColors.primaryColor,),
                      Text('Upgrade Pro', style: getSmallTextStyle(
                          color: AppColors.primaryColor),)
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
