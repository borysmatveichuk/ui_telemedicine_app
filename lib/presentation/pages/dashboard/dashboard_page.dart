import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ui_telemedicine_app/router.dart';

class DashboardPage extends StatefulWidget {
  final Widget child;

  const DashboardPage({super.key, required this.child});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final goRouter = GoRouter.of(context);

    return Scaffold(
      body: SafeArea(child: widget.child),
      bottomNavigationBar: NavigationBar(
        // height: 100,
        indicatorShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
        onDestinationSelected: (idx) {
          switch (idx) {
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

          selectedIndex = idx;
          setState(() {});
        },
        selectedIndex: selectedIndex,
        destinations: [
          NavigationDestination(
            icon: Icon(
              CupertinoIcons.house_alt,
              color: Colors.black,
              size: 32,
            ),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(
              CupertinoIcons.search,
              color: Colors.black,
              size: 32,
            ),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(
              CupertinoIcons.chat_bubble,
              color: Colors.black,
              size: 32,
            ),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(
              CupertinoIcons.person,
              color: Colors.black,
              size: 32,
            ),
            label: '',
          ),
          //BottomNavigationBarItem(icon: Icon(CupertinoIcons.search), label: ''),
        ],
      ),
    );
  }
}
