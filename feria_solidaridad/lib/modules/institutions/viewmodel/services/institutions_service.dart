import 'package:feria_solidaridad/constants/app_constants.dart';
import 'package:feria_solidaridad/constants/assets_constants.dart';
import 'package:feria_solidaridad/constants/debug_constants.dart';
import 'package:feria_solidaridad/modules/institutions/model/institution.dart';
import 'package:feria_solidaridad/modules/institutions/model/institutions_response.dart';
import 'package:feria_solidaridad/modules/projects/model/project.dart';
import 'package:feria_solidaridad/networking/network_request.dart';
import 'package:feria_solidaridad/networking/network_request_body.dart';
import 'package:feria_solidaridad/networking/network_response.dart';
import 'package:feria_solidaridad/networking/network_service.dart';

abstract class InstitutionsServiceType {
  Future<InstitutionsResponse> fetchInstitutionsData();
}

class InstitutionsService implements InstitutionsServiceType {
  NetworkServiceType networkService;

  InstitutionsService({required this.networkService});

  @override
  Future<InstitutionsResponse> fetchInstitutionsData() async {
    final request = NetworkRequest(
      type: NetworkRequestType.GET,
      path: kApiPaths[ApiPath.getAllInstitutions] ?? "",
      data: NetworkRequestBody.empty(),
    );

    NetworkResponse response = await networkService.execute(request);

    print("\n\n");
    print(response.data?["data"]);
    print("\n\n");

    if (response.data == null) {
      return InstitutionsResponse(
        retrievedInstitutions: [],
      );
    }

    return InstitutionsResponse.fromMapList(response.data!["data"]);
  }
}

class InstitutionsServiceMock implements InstitutionsServiceType {
  @override
  Future<InstitutionsResponse> fetchInstitutionsData() async {
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
              name: "Proyecto 1",
              modality: "Presencial",
              hours: 20,
            ),
            Project(
              name: "Proyecto 2",
              modality: "Semipresencial",
              hours: 300,
            ),
          ],
          contacts: ["facebook.com/institucion", "instagram.com/institucion"],
          id: i,
        ),
      );
    }

    return InstitutionsResponse(retrievedInstitutions: institutions);
  }
}
