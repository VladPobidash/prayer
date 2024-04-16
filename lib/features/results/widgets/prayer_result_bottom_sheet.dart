import 'package:flutter/material.dart';
import 'package:prayer/repositories/results/results.dart';
import 'package:prayer/ui/ui.dart';

class PrayerResultBottomSheet extends StatefulWidget {
  const PrayerResultBottomSheet({
    super.key,
    this.result,
  });

  final PrayerResult? result;

  @override
  State<PrayerResultBottomSheet> createState() =>
      _PrayerResultBottomSheetState();
}

class _PrayerResultBottomSheetState extends State<PrayerResultBottomSheet> {
  final _summaryController = TextEditingController();

  @override
  void initState() {
    if (widget.result != null) {
      _summaryController.text = widget.result!.summary;
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
        child: Container(
          height: 550,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Результат молитви', style: theme.textTheme.titleMedium),
              const SizedBox(height: 4),
              BaseTextField(
                autofocus: true,
                hintText: "Опиши результат молитви",
                controller: _summaryController,
                inputType: TextInputType.multiline,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
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
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      onPressed: () => _onSavePressed(context),
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
        ),
      ),
    );
  }

  _onSavePressed(BuildContext context) {
    final summary = _summaryController.text;

    if (summary.isNotEmpty) {
      Navigator.of(context).pop(summary);
    }
  }

  _close(BuildContext context) {
    Navigator.of(context).pop();
  }
}
