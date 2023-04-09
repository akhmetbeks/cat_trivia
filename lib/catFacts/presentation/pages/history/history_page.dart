import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/cat_fact/cat_fact_bloc.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: BlocBuilder<CatFactBloc, CatFactState>(
        builder: (context, state) {
          if (state is CatFactsHistoryLoaded) {
            return ListView.builder(
              itemCount: state.facts.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Text(state.facts[index].fact),
                      Text(state.facts[index].createdAt.toString()),
                    ],
                  ),
                );
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
