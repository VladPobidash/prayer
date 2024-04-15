import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prayer/features/topics/bloc/prayer_topics_bloc.dart';
import 'package:prayer/repositories/topics/topics.dart';
import 'package:prayer/ui/ui.dart';
import 'package:realm/realm.dart';

class PrayerTopicBottomSheet extends StatefulWidget {
  const PrayerTopicBottomSheet({
    super.key,
    this.topicId,
  });

  final String? topicId;

  @override
  State<PrayerTopicBottomSheet> createState() => _PrayerTopicBottomSheetState();
}

class _PrayerTopicBottomSheetState extends State<PrayerTopicBottomSheet> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void initState() {
    if (widget.topicId != null) {
      BlocProvider.of<PrayerTopicsBloc>(context).add(
        LoadPrayerTopic(widget.topicId!),
      );
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BaseBottomSheet(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusScope.of(context).unfocus(),
        child: BlocConsumer<PrayerTopicsBloc, PrayerTopicsState>(
          listener: (context, state) {
            if (state is PrayerTopicLoaded) {
              _nameController.text = state.topic.name;
              _descriptionController.text = state.topic.description;
            }

            if (state is PrayerTopicFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.error,
                    style: theme.textTheme.bodyMedium,
                  ),
                  backgroundColor: theme.colorScheme.errorContainer,
                  dismissDirection: DismissDirection.up,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            }

            if (state is PrayerTopicSuccess) _close(context);
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Назва', style: theme.textTheme.titleMedium),
                      const SizedBox(height: 4),
                      BaseTextField(
                        hintText: "Почни вводити назву",
                        controller: _nameController,
                        inputType: TextInputType.text,
                      ),
                      const SizedBox(height: 16),
                      Text('Опис', style: theme.textTheme.titleMedium),
                      const SizedBox(height: 4),
                      BaseTextField(
                        hintText: "Додай опис",
                        controller: _descriptionController,
                        inputType: TextInputType.multiline,
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          onPressed: () => _close(context),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Text(
                              'Відмінити',
                              style: theme.textTheme.titleMedium,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(
                              theme.primaryColor,
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          onPressed: () {
                            final topic =
                                state is PrayerTopicLoaded ? state.topic : null;

                            _onSavePressed(context, topic);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Text(
                              'Зберегти',
                              style: theme.textTheme.titleMedium?.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  _onSavePressed(BuildContext context, [PrayerTopic? prevTopic]) {
    final name = _nameController.text;
    final description = _descriptionController.text;

    if (name.isNotEmpty && description.isNotEmpty) {
      final topic = PrayerTopic(
        prevTopic?.id ?? Uuid.v4().toString(),
        name,
        description,
        false,
        results: prevTopic?.results ?? [],
      );

      final event = prevTopic != null
          ? UpdatePrayerTopic(topic)
          : CreatePrayerTopic(topic);

      BlocProvider.of<PrayerTopicsBloc>(context).add(event);
    }
  }

  _close(BuildContext context) {
    BlocProvider.of<PrayerTopicsBloc>(context).add(LoadPrayerTopicsList());
    Navigator.of(context).pop();
  }
}
