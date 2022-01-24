import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fq_mobile/data/constants.dart';
import 'package:fq_mobile/data/repositories/sp_app_props_repo.dart';
import 'package:fq_mobile/domain/cubits/app_cubit.dart';
import 'package:fq_mobile/domain/entities/app_props.dart';
import 'package:fq_mobile/domain/states/app_props_state.dart';
import 'package:fq_mobile/ui/pages/home.dart';
import 'package:fq_mobile/ui/pages/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Application extends StatefulWidget {
  final SharedPreferences prefs;

  const Application({Key? key, required this.prefs}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  int _selectedIndex = 0;
  static const List<Widget> _pages = [HomePage(), SettingsPage()];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppPropsCubit>(
        create: (BuildContext ctx) =>
            AppPropsCubit(SharedPreferencesAppPropsRepo(widget.prefs)),
        child: BlocBuilder<AppPropsCubit, AppPropsState>(
            builder: (context, state) {
          final props = _getProps(state);
          return MaterialApp(
              theme: AppThemes.lightTheme,
              darkTheme: AppThemes.darkTheme,
              themeMode: props.themeMode,
              home: Scaffold(
                appBar: _getAppBar(props.themeMode, context),
                body: Center(child: _pages.elementAt(_selectedIndex)),
                bottomNavigationBar: _getNavigatorBar(),
              ));
        }));
  }

  AppBar _getAppBar(ThemeMode mode, BuildContext context) {
    return AppBar(
      leading: Image.asset("assets/images/logo.png"),
      title: const Text("Sber FQ"),
      actions: [
        Row(
          children: [
            const Icon(Icons.wb_sunny_outlined),
            Switch(
                value: mode == ThemeMode.dark,
                onChanged: (val) {
                  _switchTheme(context, val);
                })
          ],
        )
      ],
    );
  }

  BottomNavigationBar _getNavigatorBar() {
    return BottomNavigationBar(
      elevation: 10,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedIconTheme: const IconThemeData(size: 30),
      unselectedIconTheme: const IconThemeData(size: 25),
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: '')
      ],
    );
  }

  _onItemTapped(int idx) {
    setState(() {
      _selectedIndex = idx;
    });
  }

  void _switchTheme(BuildContext context, bool themeIsDark) {
    final value = themeIsDark ? ThemeMode.dark : ThemeMode.light;
    context.read<AppPropsCubit>().saveProps(AppProps(value));
  }

  AppProps _getProps(AppPropsState state) {
    if (state is InitialState) {
      return state.initial;
    } else if (state is LoadedState) {
      return state.appProps;
    }
    return InitialState().initial;
  }
}
