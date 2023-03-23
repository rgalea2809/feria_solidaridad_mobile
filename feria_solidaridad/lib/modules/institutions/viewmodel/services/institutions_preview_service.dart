import 'package:feria_solidaridad/constants/app_constants.dart';
import 'package:feria_solidaridad/modules/institutions/model/institutions_preview_response.dart';
import 'package:feria_solidaridad/networking/network_request.dart';
import 'package:feria_solidaridad/networking/network_request_body.dart';
import 'package:feria_solidaridad/networking/network_response.dart';
import 'package:feria_solidaridad/networking/network_service.dart';

abstract class InstitutionsPreviewServiceType {
  Future<InstitutionsPreviewResponse> fetchInstitutionsPreviewData(int page);
}

class InstitutionsPreviewService implements InstitutionsPreviewServiceType {
  NetworkServiceType networkService;

  InstitutionsPreviewService({required this.networkService});

  @override
  Future<InstitutionsPreviewResponse> fetchInstitutionsPreviewData(
      int page) async {
    final request = NetworkRequest(
      type: NetworkRequestType.GET,
      path: kApiPaths[ApiPath.getAllInstitutions] ?? "",
      data: NetworkRequestBody.empty(),
      queryParams: {'page': page.toString(), 'limit': 4.toString()},
    );

    NetworkResponse response = await networkService.execute(request);

    if (response.data == null) {
      return InstitutionsPreviewResponse.empty();
    }

    return InstitutionsPreviewResponse.fromMap(response.data!);
  }
}
