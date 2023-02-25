import 'package:feria_solidaridad/constants/theme_constants.dart';
import 'package:feria_solidaridad/modules/institution_detail/view/institution_detail_page.dart';
import 'package:feria_solidaridad/modules/institutions/model/institution.dart';
import 'package:feria_solidaridad/modules/institutions/viewmodel/institutions_provider.dart';
import 'package:feria_solidaridad/modules/institutions/viewmodel/services/institutions_service.dart';
import 'package:feria_solidaridad/widgets/image_loader.dart';
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
        return Column(
          children: [
            getPageIndicator(state.numberOfPages, state.currentPage, context),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return InstitutionCard(
                    institution: state.currentInstitutions[index],
                  );
                },
                itemCount: state.currentInstitutions.length,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget getPageIndicator(
    int numberOfPages,
    int currentPage,
    BuildContext context,
  ) {
    Widget numbersSection = Container();

    if (numberOfPages <= 5) {
      numbersSection = Expanded(
        child: Row(
          children: List.generate(
            numberOfPages,
            (page) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${page + 1}",
                  style: Theme.of(context).textTheme.button?.copyWith(
                      fontWeight: currentPage == page + 1
                          ? FontWeight.bold
                          : FontWeight.normal),
                ),
              );
            },
          ),
        ),
      );
    } else {
      if (currentPage == 1 || currentPage == numberOfPages) {
        numbersSection = Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "1",
                style: Theme.of(context).textTheme.button?.copyWith(
                    fontWeight:
                        currentPage == 1 ? FontWeight.bold : FontWeight.normal),
              ),
              const Text("..."),
              Text(
                "$numberOfPages",
                style: Theme.of(context).textTheme.button?.copyWith(
                    fontWeight: currentPage == numberOfPages
                        ? FontWeight.bold
                        : FontWeight.normal),
              ),
            ],
          ),
        );
      } else {
        numbersSection = Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "1",
                style: Theme.of(context).textTheme.button?.copyWith(
                      fontWeight: currentPage == 1
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
              ),
              const Text("..."),
              Text(
                "$currentPage",
                style: Theme.of(context).textTheme.button?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Text("..."),
              Text(
                "$numberOfPages",
                style: Theme.of(context).textTheme.button,
              ),
            ],
          ),
        );
      }
    }

    return Row(
      children: [
        IconButton(
          onPressed: currentPage > 1
              ? () {
                  Provider.of<InstitutionsProvider>(context, listen: false)
                      .changeInstitutionsPage(currentPage - 1);
                }
              : null,
          icon: const Icon(Icons.chevron_left),
        ),
        const SizedBox(width: 16),
        numbersSection,
        const SizedBox(width: 16),
        IconButton(
          onPressed: currentPage < numberOfPages
              ? () {
                  Provider.of<InstitutionsProvider>(context, listen: false)
                      .changeInstitutionsPage(currentPage + 1);
                }
              : null,
          icon: const Icon(Icons.chevron_right),
        ),
      ],
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
                      child: ImageLoader(imageUrl: institution.imageUrl),
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
              Text(institution.description),
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
