import 'dart:convert';

import 'package:feria_solidaridad/modules/events_tab/model/event.dart';

class EventResponse {
  List<Event> data;
  int statusCode;
  String? error;
  String? message;

  EventResponse({
    required this.data,
    required this.statusCode,
    this.error,
    this.message,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'data': data.map((x) => x.toMap()).toList()});
    result.addAll({'statusCode': statusCode});
    if (error != null) {
      result.addAll({'error': error});
    }
    if (message != null) {
      result.addAll({'message': message});
    }

    return result;
  }

  factory EventResponse.fromMap(Map<String, dynamic> map) {
    return EventResponse(
      data: List<Event>.from(map['data']?.map((x) => Event.fromMap(x))),
      statusCode: map['statusCode']?.toInt() ?? 0,
      error: map['error'],
      message: map['message'],
    );
  }

  String toJson() => json.encode(toMap());

  factory EventResponse.fromJson(String source) =>
      EventResponse.fromMap(json.decode(source));
}
