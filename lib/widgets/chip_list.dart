import 'package:cobe_hive_mobile_app/app_colors.dart';
import 'package:flutter/material.dart';

class ChipList extends StatefulWidget {
  const ChipList({super.key});

  @override
  State<ChipList> createState() => _ChipListState();
}

class _ChipListState extends State<ChipList> {
  final List<String> statusFilter = [
    "All",
    "Offline",
    "Online",
    "Sick",
    "Away",
    "Vacation",
    "Parental",
    "Other"
  ];
  Set<String> selectedFilters = <String>{};
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: statusFilter.length,
      itemBuilder: (context, index) {
        final isSelected = selectedFilters.contains(statusFilter[index]);
        return FilterChip(
          onSelected: (bool selected) {
            setState(() {
              if (selected) {
                selectedFilters.add(statusFilter[index]);
              } else {
                selectedFilters.remove(statusFilter[index]);
              }
            });
          },
          selected: isSelected,
          label: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 5),
            child: Text(statusFilter[index],
                style: TextStyle(
                  color: isSelected
                      ? AppColors.textSecondary
                      : AppColors.textAccent,
                  fontSize: 18,
                  fontWeight: FontWeight.w100,
                )),
          ),
          backgroundColor: AppColors.background, //neradi transparrent?
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
      separatorBuilder: (context, index) => const SizedBox(width: 10),
    );
  }
}
