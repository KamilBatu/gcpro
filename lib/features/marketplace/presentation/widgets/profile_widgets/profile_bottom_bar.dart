import 'package:auto_route/auto_route.dart';
import 'package:gcpro_design_system/gcpro_design_system.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/reusable_widgets/actionbutton_iconsbutton.dart';
import 'package:gcpro/routes/app_route.gr.dart';
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width * 0.60,
          child: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home, size: iconSize),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag, size: iconSize),
                label: 'All items',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category, size: iconSize),
                label: 'new arrivals',
              ),
            ],
            currentIndex: currentIndex,
            onTap: onTap,
            showUnselectedLabels: true,
            elevation: 0,
            selectedLabelStyle: const TextStyle(fontSize: 12),
            unselectedLabelStyle: const TextStyle(fontSize: 10),
          ),
        ),
        buildActionButton(
            label: 'Chat Now',
            onPressed: () {
              context.router.navigate(const ChatRoute());
            },
            context: context,
            textColor: kColorWhite,
            heightValue: 0.05)
      ],
    );
  }
}
