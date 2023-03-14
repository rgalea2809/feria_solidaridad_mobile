import 'package:feria_solidaridad/constants/app_constants.dart';
import 'package:feria_solidaridad/modules/events_tab/model/event_response.dart';
import 'package:feria_solidaridad/networking/network_request.dart';
import 'package:feria_solidaridad/networking/network_request_body.dart';
import 'package:feria_solidaridad/networking/network_response.dart';
import 'package:feria_solidaridad/networking/network_service.dart';

abstract class EventsServiceType {
  Future<EventsResponse> fetchEvents();
}

class EventsService implements EventsServiceType {
  NetworkServiceType networkService;

  EventsService({
    required this.networkService,
  });

  @override
  Future<EventsResponse> fetchEvents() async {
    final request = NetworkRequest(
      type: NetworkRequestType.GET,
      path: kApiPaths[ApiPath.getAllEvents] ?? "",
      data: NetworkRequestBody.empty(),
    );

    NetworkResponse response = await networkService.execute(request);

    if (response.data == null) {
      return EventsResponse.empty();
    }

    return EventsResponse.fromMap(response.data!);
  }
}
