import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prayer/bloc/theme/theme_cubit.dart';
import 'package:prayer/features/settings/widgets/widgets.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          snap: true,
          floating: true,
          title: Text('Налаштування'),
          elevation: 0,
          surfaceTintColor: Colors.transparent,
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(
          child: SettingsToggleCard(
            title: 'Темна тема',
            value: context.watch<ThemeCubit>().state.isDark,
            onChanged: (value) => _setThemeBrightness(context, value),
          ),
        ),
        SliverToBoxAdapter(
          child: SettingsToggleCard(
            title: 'Сповіщення',
            value: true,
            onChanged: (value) {},
          ),
        ),
        SliverToBoxAdapter(
          child: SettingsToggleCard(
            title: 'Дозволити аналітику',
            value: true,
            onChanged: (value) {},
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(
            child: SettingsActionCard(
          title: 'Підтримка',
          iconData: Icons.support_agent_outlined,
          onTap: () {},
        )),
      ],
    );
  }

  void _setThemeBrightness(BuildContext context, bool value) {
    context
        .read<ThemeCubit>()
        .setThemeBrightness(value ? Brightness.dark : Brightness.light);
  }
}
