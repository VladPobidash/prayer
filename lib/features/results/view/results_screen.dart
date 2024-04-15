import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prayer/features/results/bloc/prayer_results_bloc.dart';
import 'package:prayer/features/results/widgets/widgets.dart';
import 'package:prayer/repositories/results/results.dart';
import 'package:prayer/ui/ui.dart';

@RoutePage()
class ResultsScreen extends StatefulWidget {
  const ResultsScreen({super.key});

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    BlocProvider.of<PrayerResultsBloc>(context).add(LoadPrayerResults());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusScope.of(context).unfocus(),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              snap: true,
              floating: true,
              title: const Text('Молитовні результати'),
              elevation: 0,
              surfaceTintColor: Colors.transparent,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(60),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4)
                      .copyWith(bottom: 8),
                  child: BaseTextField(
                    hintText: "Пошук",
                    controller: _searchController,
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      color: theme.hintColor.withOpacity(0.4),
                    ),
                    inputType: TextInputType.text,
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            BlocBuilder<PrayerResultsBloc, PrayerResultsState>(
              builder: (context, state) {
                if (state is PrayerResultsLoaded && state.results.isNotEmpty) {
                  return AnimatedBuilder(
                    animation: _searchController,
                    builder: (context, _) {
                      final query = _searchController.text;
                      final results = query.length > 2
                          ? state.results
                              .where((e) => e.summary
                                  .toLowerCase()
                                  .contains(query.toLowerCase()))
                              .toList()
                          : state.results;

                      return SliverList.builder(
                        itemCount: results.length,
                        itemBuilder: (context, index) {
                          final result = results[index];

                          return PrayerResultListItem(
                            result: result,
                            onTapEdit: () => _editResult(result),
                            onTapDelete: () => _deleteResult(result.id),
                          );
                        },
                      );
                    },
                  );
                }

                if (state is PrayerResultInitial) {
                  return const ResultsListInitialBanner();
                }

                return const SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _editResult(PrayerResult result) async {
    final bloc = BlocProvider.of<PrayerResultsBloc>(context);

    final summary = await showModalBottomSheet<String>(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.only(top: 60),
        child: PrayerResultBottomSheet(result: result),
      ),
    );

    if (summary?.isNotEmpty ?? false) {
      bloc.add(
        UpdatePrayerResult(
          PrayerResult(
            result.id,
            result.topicName,
            summary!,
            result.createdAt,
          ),
        ),
      );
    }
  }

  void _deleteResult(String id) {
    BlocProvider.of<PrayerResultsBloc>(context).add(DeletePrayerResult(id));
  }
}
