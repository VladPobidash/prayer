import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:prayer/router/router.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AutoTabsRouter(
      routes: const [
        TopicsRoute(),
        ResultsRoute(),
        SettingsRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: theme.primaryColor,
            unselectedItemColor: theme.hintColor,
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) => _openPage(index, tabsRouter),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.topic_outlined),
                label: 'Теми',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.check_circle_outline_rounded),
                label: 'Результат',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Налаштування',
              ),
            ],
          ),
        );
      },
    );
  }

  void _openPage(int index, TabsRouter tabsRouter) {
    tabsRouter.setActiveIndex(index);
  }
}
