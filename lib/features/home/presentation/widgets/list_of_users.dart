import 'package:flutter/material.dart';
class ListOfUsers extends StatelessWidget {
  const ListOfUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 60,
      height: 20,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
              left: 30,
              child: CircleAvatar(
                backgroundImage:
                AssetImage('assets/images/circle3.png'),
                radius: 12,
              )),
          Positioned(
              left: 15,
              child: CircleAvatar(
                backgroundImage:
                AssetImage('assets/images/circle2.png'),
                radius: 12,
              )),
          Positioned(
              left: 0,
              child: CircleAvatar(
                radius: 12,
                backgroundImage:
                AssetImage('assets/images/circle1.png'),
              ))
        ],
      ),
    );
  }
}
