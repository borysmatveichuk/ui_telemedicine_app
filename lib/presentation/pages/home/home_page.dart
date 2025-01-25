import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ui_telemedicine_app/router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final goRouter = GoRouter.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 16,
      children: [
        Center(child: const Text('Home page')),
        Center(
          child: ElevatedButton(
            onPressed: () {
              goRouter.push(AppRoutes.doctorDetails);
            },
            child: const Text('Doctor Smith'),
          ),
        )
      ],
    );
  }
}
