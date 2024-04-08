import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prayer/bloc/theme/theme_cubit.dart';
import 'package:prayer/repositories/settings/settings.dart';
import 'package:prayer/router/router.dart';
import 'package:prayer/ui/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final preferences = await SharedPreferences.getInstance();

  runApp(PrayerApp(
    preferences: preferences,
  ));
}

class PrayerApp extends StatefulWidget {
  const PrayerApp({
    super.key,
    required this.preferences,
  });

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
