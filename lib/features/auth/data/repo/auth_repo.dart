import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../../core/services/remote/end_points.dart';
import '../models/user_model.dart';

class AuthRepo {
  static Future<UserModel?>register({required String name,required String email,required String password})async{
    try{
      var response = await Dio().post(AppEndPoints.baseUrl+AppEndPoints.register,
      data: {
        "name":name,
        "email":email,
        "password":password
      }
      );
      if(response.statusCode==200){
        return UserModel.fromJson(response.data);
      }else{
        return null ;
      }
    }catch(e){
      log(e.toString());
      return null;
    }
  }
}