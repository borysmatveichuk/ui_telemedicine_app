import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ui_telemedicine_app/router.dart';
import 'package:ui_telemedicine_app/theme/app_theme.dart';

class DashboardPage extends StatefulWidget {
  final Widget child;

  const DashboardPage({super.key, required this.child});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int selectedIndex = 0;

  void _onNavTap(int index) {
    setState(() => selectedIndex = index);
    final goRouter = GoRouter.of(context);
    switch (index) {
      case 0:
        goRouter.go(AppRoutes.home);
        break;
      case 1:
        goRouter.go(AppRoutes.search);
        break;
      case 2:
        goRouter.go(AppRoutes.chat);
        break;
      case 3:
        goRouter.go(AppRoutes.profile);
        break;
      default:
        goRouter.go(AppRoutes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: widget.child),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: _onNavTap,
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  final List<IconData> icons = const [
    CupertinoIcons.house_alt,
    CupertinoIcons.search,
    CupertinoIcons.chat_bubble,
    CupertinoIcons.person,
  ];

  @override
  Widget build(BuildContext context) {
    final selectedIconColor = Theme.of(context).appColors2.invertedTextColor;
    final unselectedIconColor = Theme.of(context).appColors2.accentTextColor;
    final indicatorColor = Theme.of(context).appColors2.accentTextColor;

    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(icons.length, (index) {
          final bool isSelected = widget.currentIndex == index;
          return GestureDetector(
            onTap: () => widget.onTap(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              padding: EdgeInsets.all(isSelected ? 12 : 0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? indicatorColor : Colors.transparent,
              ),
              child: Icon(
                icons[index],
                size: 32,
                color: isSelected ? selectedIconColor : unselectedIconColor,
              ),
            ),
          );
        }),
      ),
    );
  }
}
