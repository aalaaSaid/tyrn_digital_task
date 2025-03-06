
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

showErrorDialog (BuildContext context , String text){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Center(child: Text(text)),
      backgroundColor: AppColors.redColor,
    ),
  );
}

showSuccessDialog (BuildContext context , String text){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Center(child: Text(text)),
      backgroundColor: AppColors.primaryColor,
    ),
  );
}

showLoadingDialog(BuildContext context){
  showDialog(context: context, builder: (context)=>const Center(
    child: CircularProgressIndicator(
      backgroundColor: Colors.transparent,
      color: AppColors.primaryColor,
    ),
  ));
}