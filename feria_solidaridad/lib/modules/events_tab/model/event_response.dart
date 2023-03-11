import 'dart:convert';

import 'package:feria_solidaridad/modules/events_tab/model/event.dart';

class EventsResponse {
  List<Event> data;
  int statusCode;
  String? error;
  String? message;

  EventsResponse({
    required this.data,
    required this.statusCode,
    this.error,
    this.message,
  });

  EventsResponse.empty()
      : data = [],
        statusCode = 200;

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

  factory EventsResponse.fromMap(Map<String, dynamic> map) {
    return EventsResponse(
      data: List<Event>.from(map['data']?.map((x) => Event.fromMap(x))),
      statusCode: map['statusCode']?.toInt() ?? 0,
      error: map['error'],
      message: map['message'],
    );
  }

  String toJson() => json.encode(toMap());

  factory EventsResponse.fromJson(String source) =>
      EventsResponse.fromMap(json.decode(source));
}
