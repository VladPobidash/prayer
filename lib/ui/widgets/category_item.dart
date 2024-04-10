import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    // required this.category,
  });

  // final Object category;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: theme.primaryColor.withOpacity(0.5),
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Icon(
            Icons.child_care_outlined,
            size: 16,
            color: theme.hintColor.withOpacity(0.5),
          ),
          const SizedBox(width: 4),
          Text(
            'Children',
            style: theme.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: theme.hintColor.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}
