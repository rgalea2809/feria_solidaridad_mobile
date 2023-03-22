// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:feria_solidaridad/constants/app_constants.dart';
import 'package:feria_solidaridad/modules/home/model/home_data_response.dart';
import 'package:feria_solidaridad/networking/network_request.dart';
import 'package:feria_solidaridad/networking/network_request_body.dart';
import 'package:feria_solidaridad/networking/network_response.dart';
import 'package:feria_solidaridad/networking/network_service.dart';

abstract class HomeServiceType {
  Future<HomeDataResponse> fetchHomeInformation();
}

class HomeService implements HomeServiceType {
  NetworkServiceType networkService;

  HomeService({
    required this.networkService,
  });

  @override
  Future<HomeDataResponse> fetchHomeInformation() async {
    final request = NetworkRequest(
      type: NetworkRequestType.GET,
      path: "${kApiPaths[ApiPath.getHomeData]}",
      data: NetworkRequestBody.empty(),
    );

    NetworkResponse response = await networkService.execute(request);

    if (response.data == null) {
      return HomeDataResponse.empty();
    }

    return HomeDataResponse.fromMap(response.data!);
  }
}
