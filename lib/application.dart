import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fq_mobile/data/constants.dart';
import 'package:fq_mobile/data/repositories/secure_app_props_repo.dart';
import 'package:fq_mobile/domain/cubits/app_props_cubit.dart';
import 'package:fq_mobile/domain/entities/app_props.dart';
import 'package:fq_mobile/domain/states/app_props_state.dart';
import 'package:fq_mobile/ui/pages/home.dart';
import 'package:fq_mobile/ui/pages/profiling.dart';
import 'package:fq_mobile/ui/pages/settings.dart';
import 'package:fq_mobile/ui/pages/tasks.dart';
import 'package:fq_mobile/ui/widgets/organisms/app_bar.dart';
import 'package:fq_mobile/ui/widgets/organisms/bottom_nav_bar.dart';
import 'package:fq_mobile/ui/widgets/organisms/loading_screen.dart';

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  int _selectedIndex = 3;
  late final List<Widget> _pages = _availablePages();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppPropsCubit>(
        create: (BuildContext ctx) =>
            AppPropsCubit(SecureAppPropsRepo())..getProps(),
        child: BlocBuilder<AppPropsCubit, AppPropsState>(
            builder: (context, state) {
          if (state is LoadingState) return const FullscreenLoading();
          final props = _getProps(state);
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate
              ],
              supportedLocales: Constants.supportedLocales,
              locale: props.locale,
              theme: Constants.lightTheme,
              darkTheme: Constants.darkTheme,
              themeMode: props.themeMode,
              home: Scaffold(
                appBar: const FqAppBar(),
                body: _pages.elementAt(_selectedIndex),
                bottomNavigationBar: FqNavBar(
                  onTap: _onItemTapped,
                  selectedIndex: _selectedIndex,
                ),
              ));
        }));
  }

  List<Widget> _availablePages() {
    return [
      const HomePage(),
      const TasksPage(),
      const ProfilingPage(),
      const SettingsPage(),
    ];
  }

  void _onItemTapped(int idx) {
    setState(() {
      _selectedIndex = idx;
    });
  }

  AppProps _getProps(AppPropsState state) {
    if (state is LoadedState) {
      return state.appProps;
    }
    return InitialState().appProps;
  }
}
