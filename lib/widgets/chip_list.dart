import 'package:cobe_hive_mobile_app/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:cobe_hive_mobile_app/user_filter_provider.dart';
import 'package:provider/provider.dart';

enum ChipStatus {
  online,
  offline,
  sick,
  away,
  vacation,
  parental,
  other,
  all,
}

final List<String> statusFilter = [
  'All',
  'Offline',
  'Online',
  'Sick',
  'Away',
  'Vacation',
  'Parental',
  'Other'
];

class ChipList extends StatefulWidget {
  const ChipList({super.key});

  @override
  State<ChipList> createState() => _ChipListState();
}

class _ChipListState extends State<ChipList> {
  @override
  Widget build(BuildContext context) {
    final userFilterProvider = Provider.of<UserFilterProvider>(context);
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: statusFilter.length,
      separatorBuilder: (context, index) => const SizedBox(width: 10),
      itemBuilder: (context, index) {
        final isSelected =
            userFilterProvider.isFilterSelected(statusFilter[index]);
        return FilterChip(
          onSelected: (bool selected) => setState(
            () {
              userFilterProvider.toggleFilter(statusFilter[index]);
            },
          ),
          selected: isSelected,
          label: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 5.0),
            child: Text(statusFilter[index],
                style: TextStyle(
                  color: isSelected
                      ? AppColors.textSecondary
                      : AppColors.textAccent,
                  fontSize: 18,
                  fontWeight: FontWeight.w100,
                )),
          ),
          backgroundColor: AppColors.background,
          shape: StadiumBorder(
            side: BorderSide(
              color: isSelected ? AppColors.green : AppColors.textAccent,
              width: 1,
            ),
          ),
          selectedColor: AppColors.green,
          elevation: isSelected ? 4 : 0,
          selectedShadowColor: AppColors.greenShadow,
          showCheckmark: false,
        );
      },
    );
  }
}
