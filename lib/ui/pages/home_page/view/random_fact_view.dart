import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubit/random_fact_view/random_fact_view_cubit.dart';
import '../../../../di/di.dart';
import '../../../../resources/app_constants.dart';
import '../../../../resources/color_constants.dart';
import '../../error_page/error_page.dart';

class RandomFactView extends StatelessWidget {
  const RandomFactView({Key? key}) : super(key: key);

  static Widget create() {
    return BlocProvider(
      create: (context) {
        return locator.get<RandomFactViewCubit>()..getFact();
      },
      child: const RandomFactView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RandomFactViewCubit, RandomFactViewState>(
      builder: (context, state) {
        switch (state.status) {
          case RandomFactViewStatus.initial:
          case RandomFactViewStatus.loading:
            return const Center(
              child: CircularProgressIndicator(color: AppColors.orange),
            );
          case RandomFactViewStatus.failure:
            return const ErrorPage();
          case RandomFactViewStatus.success:
            return Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 120),
              child: Column(
                children: [
                  _buildCatImage(state),
                  const SizedBox(height: 36),
                  AutoSizeText(
                    state.fact.fact,
                    maxLines: 8,
                    minFontSize: 20,
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  _buildMeowButton(context, state),
                ],
              ),
            );
        }
      },
    );
  }

  Widget _buildCatImage(RandomFactViewState state) {
    return AspectRatio(
      aspectRatio: 16 / 12,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image(
          fit: BoxFit.cover,
          image: NetworkImage(state.image),
        ),
      ),
    );
  }

  Widget _buildMeowButton(BuildContext context, RandomFactViewState state) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          context.read<RandomFactViewCubit>().setFact(state.fact);
        },
        child: const Text(AppConstants.meow, style: TextStyle(fontSize: 16)),
      ),
    );
  }
}
