import 'package:feria_solidaridad/constants/theme_constants.dart';
import 'package:flutter/material.dart';

class InstitutionsTab extends StatelessWidget {
  const InstitutionsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Instituciones"),
        backgroundColor: kPrimaryColor,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Text("Card $index"),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
