import 'package:cobe_hive_mobile_app/data/constants/app_colors.dart';
import 'package:cobe_hive_mobile_app/capitalize_string.dart';
import 'package:cobe_hive_mobile_app/data/models/leave_request.dart';
import 'package:cobe_hive_mobile_app/providers/create_request_screen_providers/leave_type_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TypeOfLeaveCard extends ConsumerWidget {
  const TypeOfLeaveCard({
    required this.leaveTypeValue,
    super.key,
  });

  final LeaveType leaveTypeValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isSelected = ref.watch(isLeaveSelectedProvider(leaveTypeValue));
    return GestureDetector(
      onTap: () => ref.read(leaveTypeProvider.notifier).state = leaveTypeValue,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.widgetBackground,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              isSelected
                  ? const BoxShadow(
                      color: AppColors.shadowDark,
                      blurRadius: 18,
                      offset: Offset(0, 5),
                    )
                  : const BoxShadow(
                      color: AppColors.shadow,
                      blurRadius: 8,
                      offset: Offset(0, 5),
                    )
            ],
            border: Border.all(
              color: isSelected ? Colors.black : AppColors.accent,
            ),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Text(leaveTypeValue.name.toString().capitalize()),
            ),
          ),
        ),
      ),
    );
  }
}
