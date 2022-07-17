import 'package:auto_size_text/auto_size_text.dart';
import 'package:cat_trivia/resources/app_constants.dart';
import 'package:cat_trivia/ui/pages/error_page/error_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubit/random_fact_view/random_fact_view_cubit.dart';
import '../../../../di/di.dart';

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
              child: CircularProgressIndicator(color: Colors.orange),
            );
          case RandomFactViewStatus.success:
            return Padding(
              padding: const EdgeInsets.only(
                top: 12,
                left: 20,
                right: 20,
                bottom: 120,
              ),
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 12,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image(
                        fit: BoxFit.cover,
                        image: NetworkImage(state.image),
                      ),
                    ),
                  ),
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
          case RandomFactViewStatus.failure:
            return const ErrorPage();
        }
      },
    );
  }

  Widget _buildMeowButton(BuildContext context, RandomFactViewState state) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          context.read<RandomFactViewCubit>().getFact();
          context.read<RandomFactViewCubit>().setFact(state.fact);
        },
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          overlayColor: MaterialStateProperty.all(Colors.orange),
          foregroundColor: MaterialStateProperty.all(Colors.black),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          padding: MaterialStateProperty.all(const EdgeInsets.all(16.0)),
          textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20)),
          side: MaterialStateProperty.all(
            const BorderSide(color: Colors.orange, width: 2),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          ),
        ),
        child: const Text(
          AppConstants.meow,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
