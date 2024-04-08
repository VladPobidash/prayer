import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prayer/ui/ui.dart';

class SettingsToggleCard extends StatelessWidget {
  const SettingsToggleCard({
    super.key,
    required this.title,
    required this.value,
    this.onChanged,
  });

  final String title;
  final bool value;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8).copyWith(bottom: 8),
      child: BaseContainer(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontSize: 18,
              ),
            ),
            CupertinoSwitch(
              activeColor: theme.primaryColor,
              value: value,
              onChanged: onChanged,
            )
          ],
        ),
      ),
    );
  }
}
