import 'package:flutter/material.dart';
import 'package:prayer/ui/ui.dart';

class BibleVerse extends StatelessWidget {
  const BibleVerse({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BaseContainer(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          Text(
            'Звернись до Мене, і Я тобі відповім, -',
            style: theme.textTheme.bodyMedium,
          ),
          Text(
            'сповіщу тобі велике й неосяжне, -',
            style: theme.textTheme.bodyMedium,
          ),
          Text(
            'відкрию те, чого ти не знаєш.',
            style: theme.textTheme.bodyMedium,
          ),
          Text(
            'Єремії 33:3',
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
