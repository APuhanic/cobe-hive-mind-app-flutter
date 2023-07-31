import 'package:cobe_hive_mobile_app/capitalize_string.dart';
import 'package:cobe_hive_mobile_app/data/constants/app_colors.dart';
import 'package:cobe_hive_mobile_app/providers/create_request_screen_providers/leave_type_provider.dart';
import 'package:cobe_hive_mobile_app/widgets/create_request_widgets/type_of_leave_list.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TypeOfLeaveSelector extends ConsumerWidget {
  const TypeOfLeaveSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedLeaveType = ref.watch(leaveTypeProvider);
    return GestureDetector(
      onTap: () => showModalBottomSheet<void>(
        showDragHandle: true,
        isScrollControlled: true,
        backgroundColor: AppColors.widgetBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        context: context,
        builder: (context) {
          return const TypeOfLeaveList();
        },
      ),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: AppColors.widgetBackground,
            borderRadius: BorderRadius.circular(13),
            boxShadow: const [
              BoxShadow(
                color: AppColors.shadow,
                blurRadius: 16,
                offset: Offset(0, 5),
              )
            ]),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
              child: Text(
                'Type',
                style: TextStyle(
                  color: AppColors.textAccent,
                  fontSize: 18,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ),
            Text(selectedLeaveType.name.toString().capitalize(),
                style: Theme.of(context).textTheme.labelMedium),
          ],
        ),
      ),
    );
  }
}
