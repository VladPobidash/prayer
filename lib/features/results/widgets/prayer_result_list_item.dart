import 'package:flutter/material.dart';
import 'package:prayer/repositories/results/models/models.dart';
import 'package:prayer/ui/ui.dart';

class PrayerResultListItem extends StatelessWidget {
  const PrayerResultListItem({
    super.key,
    required this.result,
    required this.onTapEdit,
    required this.onTapDelete,
  });

  final PrayerResult result;
  final VoidCallback onTapEdit;
  final VoidCallback onTapDelete;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BaseContainer(
      margin: const EdgeInsets.only(bottom: 12),
      width: double.infinity,
      child: ListTile(
        title: RichText(
          text: TextSpan(
            style: theme.textTheme.bodyLarge
                ?.copyWith(fontWeight: FontWeight.w600),
            children: [
              TextSpan(text: result.topicName),
              TextSpan(
                text: ' (${result.createdAt.toString().substring(0, 10)})',
                style: TextStyle(
                  fontSize: 14,
                  color: theme.hintColor,
                ),
              ),
            ],
          ),
        ),
        subtitle: Text(
          result.summary,
          style: theme.textTheme.bodyMedium,
          maxLines: 3,
        ),
        trailing: PopupMenuButton<int>(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.more_vert_outlined,
              color: Colors.white,
            ),
          ),
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem<int>(
                onTap: onTapEdit,
                child: Row(
                  children: [
                    const Icon(Icons.edit_outlined),
                    const SizedBox(width: 8),
                    Text(
                      'Редагувати',
                      style: theme.textTheme.bodyMedium,
                    )
                  ],
                ),
              ),
              PopupMenuItem(
                onTap: onTapDelete,
                child: Row(
                  children: [
                    Icon(
                      Icons.delete_outline,
                      color: theme.colorScheme.error,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Видалити',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.error,
                      ),
                    )
                  ],
                ),
              ),
            ];
          },
        ),
      ),
    );
  }
}
