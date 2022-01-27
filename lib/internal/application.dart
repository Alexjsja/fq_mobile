import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fq_mobile/data/constants.dart';
import 'package:fq_mobile/data/repositories/secure_app_props_repo.dart';
import 'package:fq_mobile/domain/cubits/app_cubit.dart';
import 'package:fq_mobile/domain/entities/app_props.dart';
import 'package:fq_mobile/domain/states/app_props_state.dart';
import 'package:fq_mobile/ui/pages/home.dart';
import 'package:fq_mobile/ui/pages/settings.dart';
import 'package:fq_mobile/ui/widgets/organisms/app_bar.dart';
import 'package:fq_mobile/ui/widgets/organisms/bottom_nav_bar.dart';

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

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
            AppPropsCubit(SecureAppPropsRepo())..getProps(),
        child: BlocBuilder<AppPropsCubit, AppPropsState>(
            builder: (context, state) {
          final props = _getProps(state);
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppThemes.lightTheme,
              darkTheme: AppThemes.darkTheme,
              themeMode: props.themeMode,
              home: Scaffold(
                appBar: FqAppBar(
                    props: props,
                    switchTheme: (val) {
                      _switchTheme(context, val);
                    }),
                body: Center(child: _pages.elementAt(_selectedIndex)),
                bottomNavigationBar: FqNavBar(
                  onTap: _onItemTapped,
                  selectedIndex: _selectedIndex,
                ),
              ));
        }));
  }

  void _onItemTapped(int idx) {
    setState(() {
      _selectedIndex = idx;
    });
  }

  void _switchTheme(BuildContext context, bool themeIsDark) {
    var mode = themeIsDark ? ThemeMode.dark : ThemeMode.light;
    var cub = context.read<AppPropsCubit>();
    var oldProps = _getProps(cub.state);
    cub.saveProps(AppProps(mode, oldProps.authorized, oldProps.session));
  }

  AppProps _getProps(AppPropsState state) {
    if (state is LoadedState) {
      return state.appProps;
    }
    return InitialState().initial;
  }
}
