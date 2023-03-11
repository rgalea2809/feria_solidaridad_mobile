import 'package:feria_solidaridad/constants/theme_constants.dart';
import 'package:feria_solidaridad/modules/app_coordinator/viewmodel/app_coordinator_provider.dart';
import 'package:feria_solidaridad/modules/events_tab/view/events_tab.dart';
import 'package:feria_solidaridad/modules/home/view/home.dart';
import 'package:feria_solidaridad/modules/institutions/view/institutions_tab.dart';
import 'package:feria_solidaridad/modules/projects/view/projects_tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppCoordinator extends StatelessWidget {
  const AppCoordinator({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppCoordinatorProvider(),
      child: Scaffold(
        body: Consumer<AppCoordinatorProvider>(
          builder: (context, state, _) {
            return CurrentAppTab(currentTab: state.currentTab);
          },
        ),
        bottomNavigationBar: Consumer<AppCoordinatorProvider>(
          builder: (context, state, _) {
            return BottomNavigationBar(
              currentIndex: state.currentTab.index,
              selectedItemColor: kPrimaryColor,
              unselectedItemColor: Colors.grey,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: "Inicio",
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.business), label: "Instituciones"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.list), label: "Proyectos"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.calendar_month), label: "Eventos"),
              ],
              onTap: (tabIndex) {
                switch (tabIndex) {
                  case 0:
                    state.changeTab(AppCoordinatorTab.home);
                    break;
                  case 1:
                    state.changeTab(AppCoordinatorTab.institutions);
                    break;
                  case 2:
                    state.changeTab(AppCoordinatorTab.projects);
                    break;
                  case 3:
                    state.changeTab(AppCoordinatorTab.events);
                    break;
                }
              },
            );
          },
        ),
      ),
    );
  }
}

class CurrentAppTab extends StatelessWidget {
  const CurrentAppTab({super.key, required this.currentTab});

  final AppCoordinatorTab currentTab;

  @override
  Widget build(BuildContext context) {
    switch (currentTab) {
      case AppCoordinatorTab.home:
        return const Home();
      case AppCoordinatorTab.institutions:
        return const InstitutionsTab();
      case AppCoordinatorTab.projects:
        return const ProjectsTab();
      case AppCoordinatorTab.events:
        return const EventsTab();
      default:
        return const Text("Not implemented");
    }
  }
}
