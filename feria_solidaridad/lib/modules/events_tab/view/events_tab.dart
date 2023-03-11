import 'package:feria_solidaridad/constants/theme_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventsTab extends StatelessWidget {
  const EventsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => null,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Eventos"),
          backgroundColor: kPrimaryColor,
        ),
      ),
    );
  }
}
