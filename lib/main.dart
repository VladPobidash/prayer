import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prayer/bloc/theme/theme_cubit.dart';
import 'package:prayer/features/results/bloc/prayer_results_bloc.dart';
import 'package:prayer/features/topics/bloc/prayer_topics_bloc.dart';
import 'package:prayer/repositories/repositories.dart';
import 'package:prayer/router/router.dart';
import 'package:prayer/ui/theme/theme.dart';
import 'package:realm/realm.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final preferences = await SharedPreferences.getInstance();

  final realm = Realm(
    Configuration.local([
      PrayerTopic.schema,
      PrayerResult.schema,
    ]),
  );

  runApp(PrayerApp(
    realm: realm,
    preferences: preferences,
  ));
}

class PrayerApp extends StatefulWidget {
  const PrayerApp({
    super.key,
    required this.realm,
    required this.preferences,
  });

  final Realm realm;
  final SharedPreferences preferences;

  @override
  State<PrayerApp> createState() => _PrayerAppState();
}

class _PrayerAppState extends State<PrayerApp> {
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    final settingsRepository = SettingsRepository(
      preferences: widget.preferences,
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(
            settingsRepository: settingsRepository,
          ),
        ),
        BlocProvider(
          create: (context) => PrayerTopicsBloc(
            prayerTopicsRepository: PrayerTopicsRepository(realm: widget.realm),
          ),
        ),
        BlocProvider(
          create: (context) => PrayerResultsBloc(
            prayerResultsRepository:
                PrayerResultsRepository(realm: widget.realm),
          ),
        )
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'Prayer',
            theme: state.isDark ? darkTheme : lightTheme,
            routerConfig: _router.config(),
          );
        },
      ),
    );
  }
}
