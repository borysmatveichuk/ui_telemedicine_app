import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:ui_telemedicine_app/theme/app_color_extension.dart';
import 'package:ui_telemedicine_app/utils/context_ext.dart';
import 'package:ui_telemedicine_app/utils/images.dart';

class DoctorDetailsPage extends StatefulWidget {
  const DoctorDetailsPage({super.key, required this.id});

  final String id;

  @override
  State<DoctorDetailsPage> createState() => _DoctorDetailsPageState();
}

class _DoctorDetailsPageState extends State<DoctorDetailsPage>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  int _selectedIndex = 1;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
    print('INIT STATE');
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
          children: [
            SizedBox(
              height: 300,
              child: Stack(
                children: [
                  Positioned(
                      top: 0,
                      bottom: 0,
                      right: 0,
                      child: Image.asset(DoctorsImages.doctor1)),
                  Column(
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
                            FaIcon(FontAwesomeIcons.heartPulse,
                                color: context.textTheme.bodyLarge?.color
                                    ?.withAlpha(180),
                                size: 16),
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
                            FaIcon(FontAwesomeIcons.stethoscope,
                                color: context.textTheme.bodyLarge?.color
                                    ?.withAlpha(180),
                                size: 16),
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
                            FaIcon(FontAwesomeIcons.star,
                                color: context.textTheme.bodyLarge?.color
                                    ?.withAlpha(180),
                                size: 16),
                            Text(
                              '5.0',
                              style: context.textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: appColors.primary, width: 2),
                  borderRadius: BorderRadius.circular(32),
                ),
                child: TabBar(
                    controller: _tabController,
                    indicator: BoxDecoration(
                      color: appColors.primary,
                      borderRadius: BorderRadius.circular(32),
                      border: Border.all(color: Colors.white, width: 1),
                    ),
                    dividerHeight: 0,
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: [
                      Tab(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(Icons.calendar_today_outlined),
                            const SizedBox(width: 8),
                            Text('Availability'),
                          ],
                        ),
                      ),
                      Tab(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(FontAwesomeIcons.newspaper),
                            const SizedBox(width: 8),
                            Text('Information'),
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                height: 800,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    BookingWidget(label: 'Availability', color: Colors.white24),
                    InformationWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InformationWidget extends StatefulWidget {
  const InformationWidget({super.key});

  @override
  State<InformationWidget> createState() => _InformationWidgetState();
}

class _InformationWidgetState extends State<InformationWidget>
    with AutomaticKeepAliveClientMixin {
  final String text = lorem(
    paragraphs: Random().nextInt(5) + 3,
    words: Random().nextInt(500) + 300,
  );

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Wrap(children: [
        Text(
          text,
          style: context.textTheme.bodyLarge,
          textAlign: TextAlign.justify,
        ),
      ]),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class BookingWidget extends StatefulWidget {
  const BookingWidget({
    super.key,
    required this.label,
    required this.color,
  });

  final String label;
  final Color color;

  @override
  State<BookingWidget> createState() => _BookingWidgetState();
}

class _BookingWidgetState extends State<BookingWidget>
    with AutomaticKeepAliveClientMixin {
  int? _value = 0;
  @override
  void initState() {
    super.initState();
    print('INIT STATE _BookingWidgetState');
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final DateTime now = DateTime.now();
    final DateTime today = DateTime(now.year, now.month, now.day);
    final List<DateTime> dates = List<DateTime>.generate(14, (int index) {
      return today.add(Duration(days: index));
    });

    return Column(
      children: [
        SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: dates.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: ChoiceChip(
                    label: SizedBox(
                      width: MediaQuery.of(context).size.width / 11,
                      child: Column(children: [
                        Text(DateFormat.E().format(dates[index]),
                            style: context.textTheme.titleMedium),
                        Text('${dates[index].day}',
                            style: context.textTheme.titleLarge),
                      ]),
                    ),
                    selected: _value == index,
                    onSelected: dates[index].weekday > 5
                        ? null
                        : (bool selected) {
                            setState(() {
                              _value = selected ? index : null;
                            });
                          },
                    // labelStyle: TextStyle(
                    //     fontWeight: FontWeight.bold, color: Colors.white),
                    // selectedColor: Colors.green,
                    // backgroundColor: Colors.blue,
                    disabledColor: Colors.grey,
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(8),
                    // ),
                    showCheckmark: false),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
