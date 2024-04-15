import 'package:flutter/material.dart';

class ResultsListInitialBanner extends StatelessWidget {
  const ResultsListInitialBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SliverFillRemaining(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Памʼятай',
              style: theme.textTheme.headlineLarge,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Записуй молитовні досвіди,\nщоб в важкі моменти надихатись ними.',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
