import 'package:feria_solidaridad/constants/theme_constants.dart';
import 'package:flutter/material.dart';

class EventsTab extends StatelessWidget {
  const EventsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Eventos"),
        backgroundColor: kPrimaryColor,
      ),
    );
  }
}
