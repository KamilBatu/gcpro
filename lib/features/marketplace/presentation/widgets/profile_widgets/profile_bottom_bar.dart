import 'package:flutter/material.dart';

class ProfileBottomBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final double iconSize;

  const ProfileBottomBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
    this.iconSize = 20.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.store, size: iconSize),
          label: 'Market',
          backgroundColor: Colors.black12,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home, size: iconSize),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag, size: iconSize),
          label: 'Item',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.category, size: iconSize),
          label: 'Category',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.contacts, size: iconSize),
          label: 'Contact',
        ),
      ],
      currentIndex: currentIndex,
      onTap: onTap,
      showUnselectedLabels: true,
      elevation: 0,
      selectedLabelStyle: const TextStyle(fontSize: 12),
      unselectedLabelStyle: const TextStyle(fontSize: 10),
      type: BottomNavigationBarType.fixed,
    );
  }
}
