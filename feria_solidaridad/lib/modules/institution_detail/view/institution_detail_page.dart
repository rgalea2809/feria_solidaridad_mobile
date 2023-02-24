import 'package:feria_solidaridad/modules/institutions/model/institution.dart';
import 'package:flutter/material.dart';

class InstitutionDetailPage extends StatelessWidget {
  const InstitutionDetailPage({super.key, required this.currentInstitution});

  final Institution currentInstitution;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentInstitution.name),
      ),
    );
  }
}
