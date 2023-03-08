import 'package:feria_solidaridad/constants/app_constants.dart';
import 'package:feria_solidaridad/constants/debug_constants.dart';
import 'package:feria_solidaridad/modules/institutions/model/institution.dart';
import 'package:feria_solidaridad/modules/institutions/model/institutions_response.dart';
import 'package:feria_solidaridad/modules/projects/model/project.dart';
import 'package:feria_solidaridad/networking/network_request.dart';
import 'package:feria_solidaridad/networking/network_request_body.dart';
import 'package:feria_solidaridad/networking/network_response.dart';
import 'package:feria_solidaridad/networking/network_service.dart';

abstract class InstitutionsServiceType {
  Future<InstitutionsResponse> fetchInstitutionsData(int page);
}

class InstitutionsService implements InstitutionsServiceType {
  NetworkServiceType networkService;

  InstitutionsService({required this.networkService});

  @override
  Future<InstitutionsResponse> fetchInstitutionsData(int page) async {
    final request = NetworkRequest(
      type: NetworkRequestType.GET,
      path: kApiPaths[ApiPath.getAllInstitutions] ?? "",
      data: NetworkRequestBody.empty(),
      queryParams: {'page': page},
    );

    NetworkResponse response = await networkService.execute(request);

    if (response.data == null) {
      return InstitutionsResponse.empty();
    }

    return InstitutionsResponse.fromMap(response.data!);
  }
}

class InstitutionsServiceMock implements InstitutionsServiceType {
  @override
  Future<InstitutionsResponse> fetchInstitutionsData(int page) async {
    List<Institution> institutions = [];

    for (int i = 0; i < 10; i++) {
      institutions.add(
        Institution(
          name: "Institucion #$i|",
          location: "Location blah blah blah",
          aboutUs: kLoremParagraph,
          objective: "Objetivo placeholder",
          mission: kLoremParagraph,
          vision: kLoremParagraph,
          projects: [
            Project(
                title: "Proyecto 1",
                modality: "Presencial",
                hours: 20,
                id: 0,
                imageUrl: ""),
            Project(
                id: 0,
                title: "Proyecto 2",
                modality: "Semipresencial",
                hours: 300,
                imageUrl: ""),
          ],
          contacts: ["facebook.com/institucion", "instagram.com/institucion"],
          id: i,
        ),
      );
    }

    return InstitutionsResponse(
      data: InstitutionsResponseData(
        meta: InstitutionsResponseMetaData(
          totalItems: 2,
          itemCount: 10,
          itemsPerPage: 10,
          totalPages: 3,
          currentPage: page,
        ),
        items: institutions,
      ),
      statusCode: 200,
    );
  }
}
