import 'package:flutter/material.dart';

import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
class InviteContainer extends StatelessWidget {
  const InviteContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 127,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xffd6feff),
        boxShadow: const [
          BoxShadow(
              color:Color(0xffABC2EB),
              offset: Offset(0, 5),
              blurRadius: 50
          )
        ],
        borderRadius: BorderRadius.circular(12),

      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Invite your friends',style: getBodyTextStyle(
                  fontSize: 18,
                ),),
                Text('Get \$20 for ticket',style: getSmallTextStyle(fontSize: 13),),
                CustomButton(
                    color: const Color(0xff00F8FF),
                    height: 40,
                    width: 85,
                    radius: 5,
                    text: 'Invite', onPressed: (){}),


              ],
            ),
          ),
          Expanded(child: Image.asset('assets/images/home.png')),
        ],
      ),
    );
  }
}
