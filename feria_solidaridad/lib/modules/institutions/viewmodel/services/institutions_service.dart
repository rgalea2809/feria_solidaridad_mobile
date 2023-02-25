import 'package:feria_solidaridad/constants/assets_constants.dart';
import 'package:feria_solidaridad/constants/debug_constants.dart';
import 'package:feria_solidaridad/modules/institutions/model/institution.dart';
import 'package:feria_solidaridad/modules/institutions/model/institutions_response.dart';
import 'package:feria_solidaridad/modules/projects/model/project.dart';

abstract class InstitutionsServiceType {
  Future<InstitutionsResponse> fetchInstitutionsData(int page);
}

class InstitutionsServiceMock implements InstitutionsServiceType {
  @override
  Future<InstitutionsResponse> fetchInstitutionsData(int page) async {
    List<Institution> institutions = [];

    for (int i = 0; i < 10; i++) {
      institutions.add(
        Institution(
          name: "Institucion #$i| Pg.$page",
          location: "Location blah blah blah",
          imageUrl: kNetworkPlaceholderImage150,
          description: kLoremParagraph,
          images: [kNetworkPlaceholderImage200, kNetworkPlaceholderImage150],
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
        ),
      );
    }

    return InstitutionsResponse(
        retrievedInstitutions: institutions, numberOfPages: 10);
  }
}
