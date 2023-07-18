import 'package:cobe_hive_mobile_app/app_colors.dart';
import 'package:cobe_hive_mobile_app/capitalize_string.dart';
import 'package:cobe_hive_mobile_app/leave_request.dart';
import 'package:cobe_hive_mobile_app/providers/leave_type_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TypeOfLeaveList extends ConsumerWidget {
  const TypeOfLeaveList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedLeaveType = ref.watch(leaveTypeProvider);
    const leaveTypeValues = LeaveType.values;

    return Container(
      height: 400,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Type of Leave',
                  style: Theme.of(context).textTheme.bodyLarge,
                )),
            const SizedBox(height: 25),
            Expanded(
              child: ListView.separated(
                itemBuilder: (itemBuilderContext, index) {
                  final leaveTypeValue = leaveTypeValues[index];
                  var isSelected = leaveTypeValue == selectedLeaveType;
                  return GestureDetector(
                    onTap: () => ref
                        .read(leaveTypeProvider.notifier)
                        .setLeaveType(leaveTypeValue),
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
                            child: Text(
                              leaveTypeValue.name.toString().capitalize(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: leaveTypeValues.length,
                separatorBuilder: (separatorBuilderContext, index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
