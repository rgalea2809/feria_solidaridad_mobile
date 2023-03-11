import 'package:feria_solidaridad/modules/events_tab/model/event.dart';
import 'package:feria_solidaridad/modules/events_tab/model/event_response.dart';
import 'package:feria_solidaridad/modules/events_tab/viewmodel/services/events_service.dart';
import 'package:flutter/material.dart';

class EventsProvider extends ChangeNotifier {
  EventsServiceType eventsService;

  EventsProvider({required this.eventsService});

  List<Event> events = [];
  bool isLoading = false;

  Future<void> fetchEvents() async {
    setLoadingState(true);

    EventsResponse eventsResponse = await eventsService.fetchEvents();

    events = eventsResponse.data;
    setLoadingState(false);
  }

  void setLoadingState(bool loadingState) {
    isLoading = loadingState;
    notifyListeners();
  }
}
