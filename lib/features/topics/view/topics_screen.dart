import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:prayer/ui/widgets/widgets.dart';

@RoutePage()
class TopicsScreen extends StatelessWidget {
  const TopicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            snap: true,
            floating: true,
            title: Text('Молитовні теми'),
            elevation: 0,
            surfaceTintColor: Colors.transparent,
          ),
          const SliverToBoxAdapter(
            child: BaseContainer(
              height: 200,
              child: Center(
                child: Text('verse of the day'),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          const SliverToBoxAdapter(
            child: BaseContainer(
              height: 50,
              child: Center(
                child: Text('filter by categories'),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverList.separated(
            itemCount: 5,
            separatorBuilder: (context, index) => const SizedBox(height: 4),
            itemBuilder: (context, index) {
              return BaseContainer(
                child: Center(
                  child: Text('Topic $index'),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
