import 'package:flutter/material.dart';

class FqNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const FqNavBar({Key? key, required this.onTap, required this.selectedIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      elevation: 10,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedIconTheme: const IconThemeData(size: 30),
      unselectedIconTheme: const IconThemeData(size: 25),
      currentIndex: selectedIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.storage), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.account_tree_outlined), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: '')
      ],
    );
  }
}
