import 'package:feria_solidaridad/modules/institutions/model/institution.dart';
import 'package:feria_solidaridad/modules/institutions/model/institution_preview.dart';
import 'package:feria_solidaridad/modules/institutions/model/institutions_response.dart';
import 'package:feria_solidaridad/modules/institutions/viewmodel/services/institutions_service.dart';
import 'package:flutter/material.dart';

class InstitutionDetailProvider extends ChangeNotifier {
  InstitutionsServiceType institutionService;
  InstitutionPreview institutionPreview;

  InstitutionDetailProvider({
    required this.institutionService,
    required this.institutionPreview,
  });

  Institution? institution;
  bool isLoading = false;

  Future<void> fetchInstitution() async {
    setLoading(true);

    InstitutionsResponse response =
        await institutionService.fetchInstitution(institutionPreview.id);

    institution = response.data.item;

    setLoading(false);
  }

  void setLoading(bool state) {
    isLoading = state;
    notifyListeners();
  }
}
