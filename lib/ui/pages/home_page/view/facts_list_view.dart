import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubit/facts_list_view/facts_list_view_cubit.dart';
import '../../../../di/di.dart';
import '../../error_page/error_page.dart';

class FactsListView extends StatelessWidget {
  const FactsListView({Key? key}) : super(key: key);

  static Widget create() {
    return BlocProvider(
      create: (context) {
        return locator.get<FactsListViewCubit>()..getFacts();
      },
      child: const FactsListView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FactsListViewCubit, FactsListViewState>(
      builder: (context, state) {
        switch (state.status) {
          case FactsListViewStatus.initial:
          case FactsListViewStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case FactsListViewStatus.failure:
            return const ErrorPage();
          case FactsListViewStatus.success:
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.facts.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: AutoSizeText(
                        state.facts[index].fact,
                        maxLines: 5,
                        minFontSize: 16,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Divider(),
                  ],
                );
              },
            );
        }
      },
    );
  }
}
