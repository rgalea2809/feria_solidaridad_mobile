import 'package:flutter/material.dart';

enum AppCoordinatorTab {
  home,
  institutions,
  projects,
  events,
}

class AppCoordinatorProvider extends ChangeNotifier {
  var currentTab = AppCoordinatorTab.home;

  // Navigation
  void changeTab(AppCoordinatorTab newTab) {
    currentTab = newTab;

    notifyListeners();
  }
}
