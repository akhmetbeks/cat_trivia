import '../../../bloc/cat_image/cat_image_bloc.dart';

import 'widgets/fact_widget.dart';
import 'widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../bloc/cat_fact/cat_fact_bloc.dart';
import '../history/history_page.dart';

class FactsPage extends StatelessWidget {
  const FactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)?.catFacts ?? ''),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              ImageWidget(),
              FactWidget(),
              ButtonsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonsWidget extends StatelessWidget {
  const ButtonsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            context.read<CatFactBloc>().add(NewCatFactEvent());
            context.read<CatImageBloc>().add(LoadCatImageEvent());
          },
          child: Text(AppLocalizations.of(context)?.anotherFacts ?? ''),
        ),
        ElevatedButton(
          onPressed: () {
            context.read<CatFactBloc>().add(LoadHistoryEvent());

            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const HistoryPage(),
              ),
            );
          },
          child: Text(AppLocalizations.of(context)?.factHistory ?? ''),
        ),
      ],
    );
  }
}
