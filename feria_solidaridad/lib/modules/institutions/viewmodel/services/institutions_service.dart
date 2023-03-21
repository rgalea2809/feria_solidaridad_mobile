import 'package:feria_solidaridad/constants/app_constants.dart';
import 'package:feria_solidaridad/modules/institutions/model/institutions_response.dart';
import 'package:feria_solidaridad/networking/network_request.dart';
import 'package:feria_solidaridad/networking/network_request_body.dart';
import 'package:feria_solidaridad/networking/network_response.dart';
import 'package:feria_solidaridad/networking/network_service.dart';

abstract class InstitutionsServiceType {
  Future<InstitutionsResponse> fetchInstitution(int institutionId);
}

class InstitutionsService implements InstitutionsServiceType {
  NetworkServiceType networkService;

  InstitutionsService({required this.networkService});

  @override
  Future<InstitutionsResponse> fetchInstitution(int institutionId) async {
    final request = NetworkRequest(
      type: NetworkRequestType.GET,
      path: "${kApiPaths[ApiPath.getAllInstitutions]}/$institutionId",
      data: NetworkRequestBody.empty(),
    );

    NetworkResponse response = await networkService.execute(request);

    if (response.data == null) {
      return InstitutionsResponse.empty();
    }

    return InstitutionsResponse.fromMap(response.data!);
  }
}
