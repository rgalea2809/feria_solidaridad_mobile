import 'package:feria_solidaridad/constants/app_constants.dart';
import 'package:feria_solidaridad/constants/theme_constants.dart';
import 'package:feria_solidaridad/modules/institution_detail/view/institution_detail_page.dart';
import 'package:feria_solidaridad/modules/institutions/model/institution.dart';
import 'package:feria_solidaridad/modules/institutions/viewmodel/institutions_provider.dart';
import 'package:feria_solidaridad/modules/institutions/viewmodel/services/institutions_service.dart';
import 'package:feria_solidaridad/networking/network_service.dart';
import 'package:feria_solidaridad/widgets/image_loader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InstitutionsTab extends StatelessWidget {
  const InstitutionsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => InstitutionsProvider(
        institutionsService: InstitutionsService(
          networkService: NetworkService(
            baseUrl: kApiBaseUrl,
          ),
        ),
      )..fetchInstitutions(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Instituciones"),
          backgroundColor: kPrimaryColor,
        ),
        body: const InstitutionsList(),
      ),
    );
  }
}

class InstitutionsList extends StatelessWidget {
  const InstitutionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<InstitutionsProvider>(
      builder: (context, state, _) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return InstitutionCard(
              institution: state.currentInstitutions[index],
            );
          },
          itemCount: state.currentInstitutions.length,
        );
      },
    );
  }
}

class InstitutionCard extends StatelessWidget {
  const InstitutionCard({
    Key? key,
    required this.institution,
  }) : super(key: key);

  final Institution institution;

  @override
  Widget build(BuildContext context) {
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
                      child: ImageLoader(imageUrl: institution.logoUrl),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        institution.name,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16.0,
              ),
              Text(institution.aboutUs ?? ""),
              const SizedBox(
                height: 16.0,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InstitutionDetailPage(
                            currentInstitution: institution),
                      ),
                    );
                  },
                  child: const Text("Ver más"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
