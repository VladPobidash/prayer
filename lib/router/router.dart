import 'package:auto_route/auto_route.dart';
import 'package:prayer/features/home/home.dart';
import 'package:prayer/features/results/results.dart';
import 'package:prayer/features/settings/settings.dart';
import 'package:prayer/features/topics/topics.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          path: '/',
          children: [
            AutoRoute(
              page: TopicsRoute.page,
              path: 'topics',
            ),
            AutoRoute(
              page: ResultsRoute.page,
              path: 'results',
            ),
            AutoRoute(
              page: SettingsRoute.page,
              path: 'settings',
            ),
          ],
        ),
      ];
}
