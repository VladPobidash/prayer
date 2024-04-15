import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prayer/features/results/bloc/prayer_results_bloc.dart';
import 'package:prayer/features/results/widgets/widgets.dart';
import 'package:prayer/features/topics/bloc/prayer_topics_bloc.dart';
import 'package:prayer/features/topics/widgets/widgets.dart';
import 'package:prayer/repositories/results/results.dart';
import 'package:prayer/repositories/topics/models/models.dart';
import 'package:realm/realm.dart';

@RoutePage()
class TopicsScreen extends StatefulWidget {
  const TopicsScreen({super.key});

  @override
  State<TopicsScreen> createState() => _TopicsScreenState();
}

class _TopicsScreenState extends State<TopicsScreen> {
  @override
  void initState() {
    BlocProvider.of<PrayerTopicsBloc>(context).add(LoadPrayerTopicsList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            snap: true,
            floating: true,
            title: Text('Молитовний записник'),
            elevation: 0,
            surfaceTintColor: Colors.transparent,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(100),
              child: BibleVerse(),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          BlocBuilder<PrayerTopicsBloc, PrayerTopicsState>(
            builder: (context, state) {
              if (state is PrayerTopicsListLoaded) {
                return SliverList.builder(
                  itemCount: state.topics.length,
                  itemBuilder: (context, index) {
                    final topic = state.topics[index];

                    return TopicListItem(
                      topic: topic,
                      onTapResolve: () => _resolveTopic(context, topic: topic),
                      onTapAddResult: () => _addResult(context, topic: topic),
                      onTapEdit: () =>
                          _showTopicBottomSheet(context, topicId: topic.id),
                      onTapDelete: () => _deleteTopic(topic.id),
                    );
                  },
                );
              }

              if (state is PrayerTopicInitial) {
                return const TopicsListInitialBanner();
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
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showTopicBottomSheet(context),
      ),
    );
  }

  void _resolveTopic(BuildContext context, {required PrayerTopic topic}) {
    BlocProvider.of<PrayerTopicsBloc>(context).add(
      UpdatePrayerTopic(
        PrayerTopic(
          topic.id,
          topic.name,
          topic.description,
          true,
          results: topic.results,
        ),
      ),
    );
  }

  void _addResult(BuildContext context, {required PrayerTopic topic}) async {
    final bloc = BlocProvider.of<PrayerResultsBloc>(context);

    final summary = await showModalBottomSheet<String>(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      context: context,
      builder: (context) => const Padding(
        padding: EdgeInsets.only(top: 60),
        child: PrayerResultBottomSheet(),
      ),
    );

    if (summary?.isNotEmpty ?? false) {
      bloc.add(
        AddPrayerResult(
          PrayerResult(
            Uuid.v4().toString(),
            topic.name,
            summary!,
            DateTime.now(),
          ),
        ),
      );
    }
  }

  void _showTopicBottomSheet(BuildContext context, {String? topicId}) {
    showModalBottomSheet<String>(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.only(top: 60),
        child: PrayerTopicBottomSheet(topicId: topicId),
      ),
    );
  }

  void _deleteTopic(String id) {
    BlocProvider.of<PrayerTopicsBloc>(context).add(DeletePrayerTopic(id));
  }
}
