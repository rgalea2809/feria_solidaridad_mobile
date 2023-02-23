import 'package:feria_solidaridad/constants/debug_constants.dart';
import 'package:feria_solidaridad/modules/institutions/model/institution.dart';
import 'package:feria_solidaridad/modules/institutions/model/institutions_response.dart';

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
          description: kLoremParagraph,
        ),
      );
    }

    return InstitutionsResponse(
        retrievedInstitutions: institutions, numberOfPages: 10);
  }
}
