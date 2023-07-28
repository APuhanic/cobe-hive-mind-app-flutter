import 'package:cobe_hive_mobile_app/data/app_colors.dart';
import 'package:cobe_hive_mobile_app/capitalize_string.dart';
import 'package:cobe_hive_mobile_app/providers/user_filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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

class ChipList extends ConsumerWidget {
  const ChipList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: StatusFilter.values.length,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      separatorBuilder: (context, index) => const SizedBox(width: 10),
      itemBuilder: (context, index) {
        var isFilterSelected =
            ref.watch(isFilterSelectedProvider(StatusFilter.values[index]));
        return FilterChip(
          onSelected: (bool selected) => ref
              .read(userFilterProvider.notifier)
              .toggleFilter(StatusFilter.values[index]),
          selected: isFilterSelected,
          label: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 5.0),
            child: Text(StatusFilter.values[index].name.toString().capitalize(),
                style: TextStyle(
                  color: isFilterSelected
                      ? AppColors.textSecondary
                      : AppColors.textAccent,
                  fontSize: 18,
                  fontWeight: FontWeight.w100,
                )),
          ),
          backgroundColor: AppColors.background,
          shape: StadiumBorder(
            side: BorderSide(
              color: isFilterSelected ? AppColors.green : AppColors.textAccent,
              width: 1,
            ),
          ),
          selectedColor: AppColors.green,
          elevation: isFilterSelected ? 4 : 0,
          selectedShadowColor: AppColors.greenShadow,
          showCheckmark: false,
        );
      },
    );
  }
}
