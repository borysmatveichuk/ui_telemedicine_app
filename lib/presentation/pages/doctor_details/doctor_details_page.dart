import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_telemedicine_app/theme/app_color_extension.dart';
import 'package:ui_telemedicine_app/utils/context_ext.dart';
import 'package:ui_telemedicine_app/utils/images.dart';

class DoctorDetailsPage extends StatelessWidget {
  const DoctorDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppColorsExtension appColors =
        Theme.of(context).extension<AppColorsExtension>()!;
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        //title: const Text('Doctor Details'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: IconButton.filledTonal(
                onPressed: () {},
                iconSize: 30,
                icon: Icon(CupertinoIcons.heart)),
          )
        ],
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(16),
        child: FilledButton(
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('Book Appointment'),
                Text('>>>'),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Dr. Liza Smith',
                style: context.textTheme.headlineLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                spacing: 4,
                children: [
                  FaIcon(FontAwesomeIcons.heartPulse, color: context.textTheme.bodyLarge?.color?.withAlpha(180), size: 16),
                  Text(
                    'Cardiologist',
                    style: context.textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                spacing: 2,
                children: [
                  FaIcon(FontAwesomeIcons.stethoscope, color: context.textTheme.bodyLarge?.color?.withAlpha(180), size: 16),
                  Text(
                    '5 years exp',
                    style: context.textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                spacing: 2,
                children: [
                  FaIcon(FontAwesomeIcons.star, color: context.textTheme.bodyLarge?.color?.withAlpha(180), size: 16),
                  Text(
                    '5.0',
                    style: context.textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
