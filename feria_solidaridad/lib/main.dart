import 'package:feria_solidaridad/constants/theme_constants.dart';
import 'package:feria_solidaridad/modules/app_coordinator/view/app_coordinator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: kAppTextTheme,
      ),
      home: const AppCoordinator(),
    );
  }
}
