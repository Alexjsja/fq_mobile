import 'package:flutter/material.dart';
import 'package:fq_mobile/data/constants.dart';
import 'package:fq_mobile/ui/pages/home.dart';
import 'package:fq_mobile/ui/pages/settings.dart';

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  int _selectedIndex = 0;
  final themeNotify = ValueNotifier(ThemeMode.light);
  static const List<Widget> _pages = [HomePage(), SettingsPage()];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotify,
        builder: (_, mode, __) {
          return MaterialApp(
              theme: AppThemes.lightTheme,
              darkTheme: AppThemes.darkTheme,
              themeMode: mode,
              home: Scaffold(
                appBar: _getAppBar(mode),
                body: Center(child: _pages.elementAt(_selectedIndex)),
                bottomNavigationBar: _getNavigatorBar(),
              ));
        });
  }

  AppBar _getAppBar(ThemeMode mode) {
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
                  _switchTheme(themeNotify, val);
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

  void _switchTheme(ValueNotifier<ThemeMode> notifier, bool themeIsDark) {
    notifier.value = themeIsDark ? ThemeMode.dark : ThemeMode.light;
  }
}
