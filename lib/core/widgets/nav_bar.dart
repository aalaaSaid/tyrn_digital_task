import 'package:flutter/material.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../utils/app_colors.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  List<Widget> screens = [
    const HomeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[0],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(2),
        decoration: const BoxDecoration(
            color: AppColors.whiteColor,
            boxShadow: [
              BoxShadow(
                  color: Color(0xff9DB2D6),
                  offset: Offset(0, -3),
                  blurRadius: 8)
            ]),
        child: BottomNavigationBar(
            backgroundColor: AppColors.whiteColor,
            showUnselectedLabels: true,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: AppColors.greyColor.withOpacity(.5),
            items:  const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.explore), label: 'Explorer'),
              BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Event'),
              BottomNavigationBarItem(icon: Icon(Icons.add,color: AppColors.whiteColor,),label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.location_on), label: 'Map'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile')
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: AppColors.primaryColor,
        onPressed: (){},child: const Icon(Icons.add_box_sharp,color: AppColors.whiteColor,),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
