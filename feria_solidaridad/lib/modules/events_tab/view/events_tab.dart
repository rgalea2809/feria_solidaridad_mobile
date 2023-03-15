import 'package:feria_solidaridad/constants/app_constants.dart';
import 'package:feria_solidaridad/constants/theme_constants.dart';
import 'package:feria_solidaridad/modules/core/core_services/url_launcher_service.dart';
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
        urlLauncherService: UrlLauncherServiceMock(),
      )..loadEvents(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Eventos"),
          backgroundColor: kPrimaryColor,
        ),
        body: const EventsListSection(),
      ),
    );
  }
}

class EventsListSection extends StatelessWidget {
  const EventsListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<EventsProvider>(builder: (context, state, _) {
      if (state.events.isEmpty) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1, color: kPrimaryColor),
                  ),
                ),
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(state.events[index].name),
                    OutlinedButton(
                      onPressed: () async {
                        await state.launchUrl(state.events[index].hyperlink);
                      },
                      child: const Text(
                        "Ver evento",
                        style: TextStyle(color: kPrimaryColor),
                      ),
                    ),
                  ],
                ),
              );
            },
            shrinkWrap: true,
            itemCount: state.events.length,
          ),
        ),
      );
    });
  }
}
