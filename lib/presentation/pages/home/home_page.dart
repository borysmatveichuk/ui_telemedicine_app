import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ui_telemedicine_app/data/model/doctor_specialization.dart';
import 'package:ui_telemedicine_app/providers/doctor_data_provider.dart';
import 'package:ui_telemedicine_app/router.dart';
import 'package:ui_telemedicine_app/theme/app_color_extension.dart';
import 'package:ui_telemedicine_app/theme/app_theme.dart';
import 'package:ui_telemedicine_app/utils/context_ext.dart';
import 'package:ui_telemedicine_app/utils/images.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final i10n = AppLocalizations.of(context)!;
    final AppColorsExtension appColors =
        Theme.of(context).extension<AppColorsExtension>()!;
    final size = MediaQuery.sizeOf(context).width;
    final doctorsData = ref.watch(doctorsDataNotifierProvider);

    final goRouter = GoRouter.of(context);
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: doctorsData.when(
              error: (error, stackTrace) => Text('$error'),
              loading: () => Center(
                child: CircularProgressIndicator(),
              ),
              data: (data) => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          i10n.howIsYourHealth,
                          style: context.textTheme.headlineLarge,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: IconButton.filledTonal(
                            onPressed: () {},
                            iconSize: 30,
                            icon: Badge(
                              smallSize: 9,
                              backgroundColor: appColors.error,
                              child: Icon(CupertinoIcons.bell),
                            )),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SearchAnchor(builder:
                        (BuildContext context, SearchController controller) {
                      return SearchBar(
                        elevation: WidgetStateProperty.all(0),
                        controller: controller,
                        onTap: () {
                          controller.openView();
                        },
                        onChanged: (_) {
                          controller.openView();
                        },
                        leading: const Icon(Icons.search),
                        hintText: i10n.searchDoctor,
                      );
                    }, suggestionsBuilder:
                        (BuildContext context, SearchController controller) {
                      return List<ListTile>.generate(5, (int index) {
                        final String item = 'item $index';
                        return ListTile(
                          title: Text(item),
                          onTap: () {
                            setState(() {
                              controller.closeView(item);
                            });
                          },
                        );
                      });
                    }),
                  ),
                  SizedBox(
                    height: 64,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      itemCount: data.doctorSpecializationAvailability.length,
                      itemBuilder: (BuildContext context, int index) {
                        final asset = data.doctorSpecializationAvailability[index].specialization.doctorAssetName(context);
                        return _CategoryItem(
                          categoryIconName: asset.image,
                          categoryName: asset.localization,
                          categoryInfo: i10n.nDoctorsAvailable(12),
                          onTap: () {
                            goRouter.push(AppRoutes.doctorDetails.path);
                          },
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      i10n.comingConsultations,
                      style: context.textTheme.headlineMedium,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Card(
                      elevation: 0,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      // Adjust the radius as needed
                                      child: Image.asset(
                                        DoctorsImages.doctor1,
                                        height: 50,
                                        width: 50,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Dr. Liza Smith',
                                        style: context.textTheme.bodyLarge,
                                      ),
                                      Text('Cardiologist',
                                          style: context.textTheme.bodyMedium),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: FilledButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(
                                      Icons.video_camera_back_outlined),
                                  label: Text(i10n.join),
                                  iconAlignment: IconAlignment.start,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            //spacing: 16,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: BorderContainer(
                                  child: TimeItem(
                                    icon: Icons.calendar_today_outlined,
                                    text: '16 September',
                                    color: context.theme.appColors2.accentColor,
                                  ),
                                ),
                              ),
                              BorderContainer(
                                child: TimeItem(
                                  icon: Icons.access_time_outlined,
                                  text: '10:00 - 10:45 AM',
                                  color: context.theme.appColors2.accentColor,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      i10n.doctorsNearYou,
                      style: context.textTheme.headlineMedium,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      children: List.generate(10, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: _DoctorItem(
                            onTap: () {
                              goRouter.pushNamed(
                                AppRoutes.doctorDetails.name,
                                pathParameters: {'id': '$index'},
                              );
                            },
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _DoctorItem extends StatelessWidget {
  const _DoctorItem({
    super.key,
    required this.onTap,
  });

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
            child: SizedBox(
              height: 180,
              child: Column(
                children: [
                  SizedBox(height: 16),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      DoctorsImages.doctor1,
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Dr. Marta Miller',
                    style: context.theme.textTheme.bodyLarge,
                  ),
                  Text(
                    'Neurologist',
                    style: context.theme.textTheme.bodyMedium,
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star,
                          size: 24, color: Color.fromRGBO(251, 171, 18, 1)),
                      Text(' 5.0 '),
                      Text(' | '),
                      Icon(CupertinoIcons.chat_bubble, size: 20),
                      Text(' 1,4k'),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: IconButton.outlined(
            onPressed: onTap,
            icon: Icon(
              //Icons.arrow_upward_outlined,
              CupertinoIcons.arrow_up_right,
              size: 30,
            ),
            style: context.theme.iconButtonTheme.style?.copyWith(
                iconColor: WidgetStateProperty.all(
                    context.theme.appColors2.accentTextColor),
                side: WidgetStateProperty.all(BorderSide(
                    width: 1.5,
                    color: context.theme.appColors2.accentTextColor))),
          ),
        ),
      ],
    );
  }
}

class TimeItem extends StatelessWidget {
  const TimeItem({
    super.key,
    required this.text,
    this.icon,
    this.color,
  });

  final IconData? icon;
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      children: [
        icon == null
            ? SizedBox.shrink()
            : Icon(
                icon,
                size: 16,
                color: color,
              ),
        Text(
          text,
          style: context.theme.textTheme.bodyMedium?.copyWith(color: color),
        ),
      ],
    );
  }
}

class _CategoryItem extends StatelessWidget {
  const _CategoryItem({
    required this.categoryIconName,
    required this.categoryName,
    required this.categoryInfo,
    required this.onTap,
  });

  final String categoryIconName;
  final String categoryName;
  final String categoryInfo;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(40),
        onTap: onTap,
        child: Ink(
          decoration: BoxDecoration(
            color: Color.fromRGBO(88, 166, 192, 1),
            borderRadius: BorderRadius.circular(40),
          ),
          width: 220,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 10),
                child: Image.asset(
                  categoryIconName,
                  height: 40,
                  color: Colors.white,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    categoryName,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.white),
                  ),
                  Text(
                    categoryInfo,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.white),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BorderContainer extends StatelessWidget {
  const BorderContainer({
    super.key,
    required this.child,
    this.strokeWidth = 1,
    this.borderRadius = 32,
    this.padding = 6,
  });

  final Widget child;
  final double strokeWidth;
  final double borderRadius;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.all(padding),
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        border: Border.all(
          width: strokeWidth,
          color: context.theme.appColors2.accentColor,
        ),
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ),
      child: child,
    );
  }
}
