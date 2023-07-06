import 'package:cobe_hive_mobile_app/app_colors.dart';
import 'package:cobe_hive_mobile_app/widgets/app_header.dart';
import 'package:cobe_hive_mobile_app/widgets/chip_list.dart';
import 'package:cobe_hive_mobile_app/widgets/employee_card_list.dart';
import 'package:cobe_hive_mobile_app/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class HomeScreen extends StatelessWidget {
  final String title;
  const HomeScreen({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Column(
          children: <Widget>[
            AppHeader(),
            Padding(
              padding:
                  EdgeInsets.only(left: 18, right: 18, top: 28, bottom: 15),
              child: CobeSearchBar(),
            ),
            Padding(
              padding: EdgeInsets.only(left: 18, bottom: 28),
              child: SizedBox(
                height: 50, //zašto height?
                child: ChipList(),
              ),
            ),
            EmployeeCardList(),
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        backgroundColor: AppColors.primary,
        icon: Icons.add,
        activeIcon: Icons.close, //icon when menu is expanded on button
        foregroundColor: Colors.white, //font color, icon color in button
        activeBackgroundColor: AppColors.primary,
        activeForegroundColor: Colors.white,
        overlayColor: AppColors.overlayShadow,
        overlayOpacity: 0.5,
        spaceBetweenChildren: 15,
        childrenButtonSize: const Size(156, 56),
        children: [
          SpeedDialChild(
            backgroundColor: AppColors.primary,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Create Request",
                style: TextStyle(color: AppColors.textSecondary),
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SpeedDialChild(
            backgroundColor: AppColors.primary,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "Add Absence",
                style: TextStyle(
                  color: AppColors.textSecondary,
                ),
              ),
            ),
            onTap: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }
}
