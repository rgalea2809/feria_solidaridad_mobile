import 'package:feria_solidaridad/constants/app_constants.dart';
import 'package:feria_solidaridad/constants/theme_constants.dart';
import 'package:feria_solidaridad/modules/events_tab/viewmodel/events_provider.dart';
import 'package:feria_solidaridad/modules/events_tab/viewmodel/services/events_service.dart';
import 'package:feria_solidaridad/networking/network_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventsTab extends StatelessWidget {
  const EventsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EventsProvider(
        eventsService: EventsService(
          networkService: NetworkService(baseUrl: kApiBaseUrl),
        ),
      )..loadEvents(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Eventos"),
          backgroundColor: kPrimaryColor,
        ),
        body: Consumer<EventsProvider>(
          builder: (context, state, _) {
            return Text("Events: ${state.events.length}");
          },
        ),
      ),
    );
  }
}
