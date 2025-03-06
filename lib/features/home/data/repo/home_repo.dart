import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../../core/services/remote/end_points.dart';
import '../models/event_details_model.dart';
import '../models/event_model.dart';
import '../models/organizer_model.dart';

class HomeRepo {
  static Future<EventModel?> getEvents({int page =1,int limit =5}) async {
    try {
      var response = await Dio().get(AppEndPoints.baseUrl + AppEndPoints.event,

          queryParameters: {'page': page,'limit':limit});
      if (response.statusCode == 200) {
        return EventModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<EventDetailsModel?>getEventDetails({
    required String eventId
}
      )async{
    try{
      var response = await Dio().get(AppEndPoints.baseUrl+AppEndPoints.eventDetails+eventId);
      if(response.statusCode==200){
        return EventDetailsModel.fromJson(response.data);
      }else{
        return null;
      }
    }catch(e){
      log(e.toString());
      return null;
    }
  }
  
  static Future<OrganizerModel?>getOrganizer({required String organizerId})async{
    try{
      var response = await Dio().get(AppEndPoints.baseUrl+AppEndPoints.organizers+organizerId);
      if(response.statusCode==200){
        return OrganizerModel.fromJson(response.data);
      }else{
        return null;
      }
    }catch(e){
      log(e.toString());
      return null;
    }
  }
}
