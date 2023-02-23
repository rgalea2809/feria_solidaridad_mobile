// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:feria_solidaridad/modules/institutions/model/institution.dart';

class InstitutionsResponse {
  List<Institution> retrievedInstitutions;
  int numberOfPages;

  InstitutionsResponse({
    required this.retrievedInstitutions,
    required this.numberOfPages,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'retrievedInstitutions':
          retrievedInstitutions.map((x) => x.toMap()).toList(),
      'numberOfPages': numberOfPages,
    };
  }

  factory InstitutionsResponse.fromMap(Map<String, dynamic> map) {
    return InstitutionsResponse(
      retrievedInstitutions: List<Institution>.from(
        (map['retrievedInstitutions'] as List<int>).map<Institution>(
          (x) => Institution.fromMap(x as Map<String, dynamic>),
        ),
      ),
      numberOfPages: map['numberOfPages'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory InstitutionsResponse.fromJson(String source) =>
      InstitutionsResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
