import 'package:feria_solidaridad/modules/institutions/model/institution.dart';
import 'package:feria_solidaridad/modules/institutions/model/institutions_response.dart';
import 'package:feria_solidaridad/modules/institutions/viewmodel/services/institutions_service.dart';
import 'package:flutter/material.dart';

class InstitutionsProvider extends ChangeNotifier {
  // Dependencies
  InstitutionsServiceType institutionsService;

  // Parameters
  List<Institution> currentInstitutions = [];
  bool isFetchingData = false;

  InstitutionsProvider({required this.institutionsService});

  Future<void> fetchInstitutions() async {
    setLoadingState(true);

    InstitutionsResponse institutionsData =
        await institutionsService.fetchInstitutionsData();

    currentInstitutions.clear();
    currentInstitutions = institutionsData.retrievedInstitutions;

    setLoadingState(false);
  }

  void setLoadingState(bool loadingState) {
    isFetchingData = loadingState;
    notifyListeners();
  }
}
