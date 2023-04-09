import 'dart:io';
import 'package:intl/intl.dart';
import '../../../../bloc/cat_fact/cat_fact_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FactWidget extends StatelessWidget {
  const FactWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var format = DateFormat.yMd(Platform.localeName);

    return BlocBuilder<CatFactBloc, CatFactState>(
      builder: (context, state) {
        if (state is CatFactLoading) {
          return const CircularProgressIndicator();
        }
        if (state is CatFactError) {
          return Text(state.error);
        }
        if (state is CatFactLoaded) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(state.fact.fact),
              Text(format.format(state.fact.createdAt)),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
