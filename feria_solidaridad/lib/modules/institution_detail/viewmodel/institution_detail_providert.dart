import 'package:feria_solidaridad/modules/core/core_services/url_launcher_service.dart';
import 'package:feria_solidaridad/modules/institutions/model/institution.dart';
import 'package:feria_solidaridad/modules/institutions/model/institution_preview.dart';
import 'package:feria_solidaridad/modules/institutions/model/institutions_response.dart';
import 'package:feria_solidaridad/modules/institutions/viewmodel/services/institutions_service.dart';
import 'package:flutter/material.dart';

class InstitutionDetailProvider extends ChangeNotifier {
  InstitutionsServiceType institutionService;
  InstitutionPreview institutionPreview;
  UrlLauncherServiceType urlLauncherService;

  InstitutionDetailProvider({
    required this.institutionService,
    required this.institutionPreview,
    required this.urlLauncherService,
  });

  Institution? institution;
  bool isLoading = false;

  Future<void> fetchInstitution() async {
    setLoading(true);

    InstitutionsResponse response =
        await institutionService.fetchInstitution(institutionPreview.id);

    institution = response.data;

    setLoading(false);
  }

  Future<void> launchUrl(String url) async {
    await urlLauncherService.openUrl(url);
  }

  void setLoading(bool state) {
    isLoading = state;
    notifyListeners();
  }
}
