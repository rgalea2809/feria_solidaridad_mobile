import 'package:feria_solidaridad/constants/assets_constants.dart';
import 'package:feria_solidaridad/constants/debug_constants.dart';
import 'package:feria_solidaridad/constants/theme_constants.dart';
import 'package:feria_solidaridad/modules/institutions/viewmodel/institutions_provider.dart';
import 'package:feria_solidaridad/modules/institutions/viewmodel/services/institutions_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InstitutionsTab extends StatelessWidget {
  const InstitutionsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          InstitutionsProvider(institutionsService: InstitutionsServiceMock())
            ..fetchInstitutions(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Instituciones"),
          backgroundColor: kPrimaryColor,
        ),
        body: InstitutionsList(),
      ),
    );
  }
}

class InstitutionsList extends StatelessWidget {
  const InstitutionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(300.0),
                          child: Image.asset(kDefaultPlaceholderImage),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Institution title #$index",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Text(kLoremParagraph),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Ver más"),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
      itemCount: 10,
    );
  }
}
