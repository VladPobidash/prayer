import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:prayer/ui/ui.dart';

@RoutePage()
class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            snap: true,
            floating: true,
            title: Text('Молитовні результати'),
            elevation: 0,
            surfaceTintColor: Colors.transparent,
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverList.separated(
            itemCount: 5,
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              return BaseContainer(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Тема молоитви',
                          style: theme.textTheme.headlineSmall,
                        ),
                        const Icon(Icons.check),
                      ],
                    ),
                    const Row(
                      children: [
                        Text('Опис відповіді на молитву'),
                      ],
                    ),
                    Row(
                      children: [
                        BaseContainer(
                          border: Border.all(),
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.cases_outlined,
                                size: 16,
                              ),
                              SizedBox(width: 4),
                              Text('Work'),
                            ],
                          ),
                        ),
                        BaseContainer(
                          border: Border.all(),
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.child_care_outlined,
                                size: 16,
                              ),
                              SizedBox(width: 4),
                              Text('Children'),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
