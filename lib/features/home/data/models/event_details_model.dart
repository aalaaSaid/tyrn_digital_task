import 'dart:convert';

class EventDetailsModel {
  bool? success;
  String? message;
  Data? data;

  EventDetailsModel({
    this.success,
    this.message,
    this.data,
  });

  factory EventDetailsModel.fromRawJson(String str) => EventDetailsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EventDetailsModel.fromJson(Map<String, dynamic> json) => EventDetailsModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  int? eventId;
  String? picture;
  DateTime? date;
  String? title;
  String? address;
  int? numberOfGoing;
  String? addressTitle;
  String? latitude;
  String? longitude;
  String? aboutEvent;
  String? eventPrice;
  Organizer? organizer;

  Data({
    this.eventId,
    this.picture,
    this.date,
    this.title,
    this.address,
    this.numberOfGoing,
    this.addressTitle,
    this.latitude,
    this.longitude,
    this.aboutEvent,
    this.eventPrice,
    this.organizer,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    eventId: json["event_id"],
    picture: json["picture"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    title: json["title"],
    address: json["address"],
    numberOfGoing: json["number_of_going"],
    addressTitle: json["address_title"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    aboutEvent: json["about_event"],
    eventPrice: json["event_price"],
    organizer: json["organizer"] == null ? null : Organizer.fromJson(json["organizer"]),
  );

  Map<String, dynamic> toJson() => {
    "event_id": eventId,
    "picture": picture,
    "date": date?.toIso8601String(),
    "title": title,
    "address": address,
    "number_of_going": numberOfGoing,
    "address_title": addressTitle,
    "latitude": latitude,
    "longitude": longitude,
    "about_event": aboutEvent,
    "event_price": eventPrice,
    "organizer": organizer?.toJson(),
  };
}

class Organizer {
  int? id;
  String? name;
  String? picture;

  Organizer({
    this.id,
    this.name,
    this.picture,
  });

  factory Organizer.fromRawJson(String str) => Organizer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Organizer.fromJson(Map<String, dynamic> json) => Organizer(
    id: json["id"],
    name: json["name"],
    picture: json["picture"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "picture": picture,
  };
}
