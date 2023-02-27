// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:feria_solidaridad/modules/institutions/model/institution.dart';

class InstitutionsResponse {
  List<Institution> retrievedInstitutions;

  InstitutionsResponse({
    required this.retrievedInstitutions,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'retrievedInstitutions':
          retrievedInstitutions.map((x) => x.toMap()).toList(),
    };
  }

  factory InstitutionsResponse.fromMapList(List<dynamic> institutionsList) {
    List<Institution> institutions = [];

    for (var institutionMap in institutionsList) {
      institutions.add(Institution.fromMap(institutionMap));
    }

    return InstitutionsResponse(retrievedInstitutions: institutions);
  }

  String toJson() => json.encode(toMap());
}
