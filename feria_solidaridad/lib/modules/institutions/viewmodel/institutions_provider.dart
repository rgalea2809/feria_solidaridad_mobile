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
  int currentPage = 1;
  int numberOfPages = 0;

  InstitutionsProvider({required this.institutionsService});

  Future<void> fetchInstitutions() async {
    setLoadingState(true);

    InstitutionsResponse institutionsData =
        await institutionsService.fetchInstitutionsData(currentPage);

    currentInstitutions.clear();
    currentInstitutions = institutionsData.data.items;
    numberOfPages = institutionsData.data.meta.totalPages;

    setLoadingState(false);
  }

  Future<void> changeInstitutionsPage(int newPage) async {
    currentPage = newPage;
    notifyListeners();

    await fetchInstitutions();
  }

  void setLoadingState(bool loadingState) {
    isFetchingData = loadingState;
    notifyListeners();
  }
}
