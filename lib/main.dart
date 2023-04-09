import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'catFacts/bloc/cat_fact/cat_fact_bloc.dart';
import 'catFacts/bloc/cat_image/cat_image_bloc.dart';
import 'catFacts/presentation/pages/facts/facts_page.dart';
import 'injection.dart' as di;

Future<void> main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<CatFactBloc>()),
        BlocProvider(create: (context) => di.sl<CatImageBloc>()),
      ],
      child: MaterialApp(
        title: AppLocalizations.of(context)?.catFacts ?? '',
        home: const FactsPage(),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}
