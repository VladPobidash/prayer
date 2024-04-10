import 'package:flutter/material.dart';
import 'package:prayer/repositories/topics/topics.dart';
import 'package:prayer/ui/ui.dart';

class TopicListItem extends StatelessWidget {
  const TopicListItem({
    super.key,
    required this.topic,
    required this.onTapResolve,
    required this.onTapAddResult,
    required this.onTapEdit,
    required this.onTapDelete,
  });

  final PrayerTopic topic;
  final VoidCallback onTapResolve;
  final VoidCallback onTapAddResult;
  final VoidCallback onTapEdit;
  final VoidCallback onTapDelete;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BaseContainer(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    topic.name,
                    style: theme.textTheme.bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    topic.description,
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
              PopupMenuButton<int>(
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
                      onTap: onTapResolve,
                      child: Row(
                        children: [
                          const Icon(Icons.add_task_outlined),
                          const SizedBox(width: 8),
                          Text(
                            'Завершити',
                            style: theme.textTheme.bodyMedium,
                          )
                        ],
                      ),
                    ),
                    PopupMenuItem<int>(
                      onTap: onTapAddResult,
                      child: Row(
                        children: [
                          const Icon(Icons.bookmark_add_outlined),
                          const SizedBox(width: 8),
                          Text(
                            'Додати результат',
                            style: theme.textTheme.bodyMedium,
                          )
                        ],
                      ),
                    ),
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
              )
            ],
          ),
          // if (topic.categories.length)
          // SizedBox(
          //   width: double.infinity,
          //   height: 32,
          //   child: ListView.separated(
          //     padding: const EdgeInsets.only(top: 8),
          //     scrollDirection: Axis.horizontal,
          //     itemCount: 2,
          //     separatorBuilder: (context, index) => const SizedBox(width: 4),
          //     itemBuilder: (context, index) {
          //       return const CategoryItem();
          //     },
          //   ),
          // )
        ],
      ),
    );
  }
}
