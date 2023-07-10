import 'package:cobe_hive_mobile_app/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:cobe_hive_mobile_app/user_filter_provider.dart';
import 'package:provider/provider.dart';

enum StatusFilter {
  all,
  online,
  offline,
  sick,
  away,
  vacation,
  parental,
  other,
}

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
      itemCount: StatusFilter.values.length,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      separatorBuilder: (context, index) => const SizedBox(width: 10),
      itemBuilder: (context, index) {
        final isSelected =
            userFilterProvider.isFilterSelected(StatusFilter.values[index]);
        return FilterChip(
          onSelected: (bool selected) => setState(
            () {
              userFilterProvider.toggleFilter(StatusFilter.values[index]);
            },
          ),
          selected: isSelected,
          label: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 5.0),
            child: Text(
                '${StatusFilter.values[index].toString().split('.').last[0].toUpperCase()}${StatusFilter.values[index].toString().split('.').last.substring(1)}',
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
