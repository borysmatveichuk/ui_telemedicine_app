import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ui_telemedicine_app/router.dart';
import 'package:ui_telemedicine_app/theme/app_color_extension.dart';
import 'package:ui_telemedicine_app/utils/context_ext.dart';
import 'package:ui_telemedicine_app/utils/images.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final i10n = AppLocalizations.of(context)!;
    final AppColorsExtension appColors =
        Theme.of(context).extension<AppColorsExtension>()!;

    final goRouter = GoRouter.of(context);
    return Column(
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
        SizedBox(
          height: 64,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16),
            children: [
              _CategoryItem(
                categoryIconName: OrgansImages.lungs,
                categoryName: 'Pulmonologist',
                categoryInfo: i10n.nDoctorsAvailable(12),
                onTap: () {
                  goRouter.push(AppRoutes.doctorDetails);
                },
              ),
              _CategoryItem(
                categoryIconName: OrgansImages.brain,
                categoryName: 'Neurologist',
                categoryInfo: i10n.nDoctorsAvailable(1),
                onTap: () {
                  goRouter.push(AppRoutes.doctorDetails);
                },
              ),
              _CategoryItem(
                categoryIconName: OrgansImages.heart,
                categoryName: 'Cardiologist',
                categoryInfo: i10n.nDoctorsAvailable(10),
                onTap: () {
                  goRouter.push(AppRoutes.doctorDetails);
                },
              ),
            ],
          ),
        ),
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
