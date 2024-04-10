import 'package:flutter/material.dart';

class TopicsListInitialBanner extends StatelessWidget {
  const TopicsListInitialBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SliverFillRemaining(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Помолись',
              style: theme.textTheme.headlineLarge,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Додай молитовну тему,\nщоб памʼятати про неї.',
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
