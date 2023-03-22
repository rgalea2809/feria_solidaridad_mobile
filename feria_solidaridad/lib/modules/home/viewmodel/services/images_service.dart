// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:feria_solidaridad/constants/app_constants.dart';
import 'package:feria_solidaridad/modules/home/model/images_response.dart';
import 'package:feria_solidaridad/networking/network_request.dart';
import 'package:feria_solidaridad/networking/network_request_body.dart';
import 'package:feria_solidaridad/networking/network_response.dart';
import 'package:feria_solidaridad/networking/network_service.dart';

abstract class ImagesServiceType {
  Future<ImagesResponse> getAllImages();
}

class ImagesService implements ImagesServiceType {
  NetworkServiceType networkService;

  ImagesService({
    required this.networkService,
  });

  @override
  Future<ImagesResponse> getAllImages() async {
    final request = NetworkRequest(
      type: NetworkRequestType.GET,
      path: "${kApiPaths[ApiPath.getAllImages]}",
      data: NetworkRequestBody.empty(),
    );

    NetworkResponse response = await networkService.execute(request);

    if (response.data == null) {
      return ImagesResponse.empty();
    }

    return ImagesResponse.fromMap(response.data!);
  }
}
