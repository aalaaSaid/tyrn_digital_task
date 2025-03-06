import 'package:flutter/material.dart';
navigateTO (BuildContext context , Widget screen){
  FocusScope.of(context).unfocus();
  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>screen));
}
navigateReplacement (BuildContext context , Widget screen){
  FocusScope.of(context).unfocus();
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>screen));
}
navigateRemove (BuildContext context , Widget screen){
  FocusScope.of(context).unfocus();
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => screen), (route) => false);

}