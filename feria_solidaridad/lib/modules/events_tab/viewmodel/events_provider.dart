import 'package:feria_solidaridad/modules/core/core_services/url_launcher_service.dart';
import 'package:feria_solidaridad/modules/events_tab/model/event.dart';
import 'package:feria_solidaridad/modules/events_tab/model/event_response.dart';
import 'package:feria_solidaridad/modules/events_tab/viewmodel/services/events_service.dart';
import 'package:flutter/material.dart';

class EventsProvider extends ChangeNotifier {
  EventsServiceType eventsService;
  UrlLauncherServiceType urlLauncherService;

  EventsProvider({
    required this.eventsService,
    required this.urlLauncherService,
  });

  List<Event> events = [];
  bool isLoading = false;

  Future<void> loadEvents() async {
    setLoadingState(true);

    EventsResponse eventsResponse = await eventsService.fetchEvents();

    events = eventsResponse.data;
    setLoadingState(false);
  }

  Future<void> launchUrl(String url) async {
    await urlLauncherService.openUrl(url);
  }

  void setLoadingState(bool loadingState) {
    isLoading = loadingState;
    notifyListeners();
  }
}
