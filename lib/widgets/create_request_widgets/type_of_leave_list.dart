import 'package:cobe_hive_mobile_app/data/models/leave_request.dart';
import 'package:cobe_hive_mobile_app/widgets/create_request_widgets/type_of_leave_card.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TypeOfLeaveList extends ConsumerWidget {
  const TypeOfLeaveList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                itemCount: leaveTypeValues.length,
                separatorBuilder: (separatorBuilderContext, index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
                itemBuilder: (itemBuilderContext, index) =>
                    TypeOfLeaveCard(leaveTypeValue: leaveTypeValues[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
