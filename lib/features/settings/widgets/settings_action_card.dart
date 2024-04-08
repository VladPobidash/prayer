import 'package:flutter/material.dart';
import 'package:prayer/ui/ui.dart';

class SettingsActionCard extends StatelessWidget {
  const SettingsActionCard({
    super.key,
    required this.title,
    required this.iconData,
    this.iconColor,
    this.onTap,
  });

  final String title;
  final IconData iconData;
  final Color? iconColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
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
              Padding(
                padding: const EdgeInsets.all(4),
                child: Icon(
                  iconData,
                  size: 32,
                  color: iconColor ?? theme.hintColor.withOpacity(0.3),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
