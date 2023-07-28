import 'package:cobe_hive_mobile_app/data/app_colors.dart';
import 'package:cobe_hive_mobile_app/providers/leave_reason_provider.dart';
import 'package:cobe_hive_mobile_app/widgets/create_request_buttons.dart';
import 'package:cobe_hive_mobile_app/widgets/create_request_header.dart';
import 'package:cobe_hive_mobile_app/widgets/date_picker.dart';
import 'package:cobe_hive_mobile_app/widgets/type_of_leave_selector.dart';
import 'package:cobe_hive_mobile_app/widgets/view_permission_selector.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CreateRequestScreen extends StatelessWidget {
  const CreateRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: const Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 40, top: 18),
                child: CreateRequestHeader(),
              ),
              TypeOfLeaveSelector(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: DatePicker(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Reason'),
                ),
              ),
              _LeaveReasonTextField(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 18),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Who can view my request?')),
              ),
              ViewPermissionSelector(),
              Expanded(flex: 2, child: SizedBox()),
              CreateRequestButtons(),
              Expanded(flex: 1, child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}

class _LeaveReasonTextField extends ConsumerWidget {
  const _LeaveReasonTextField();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: AppColors.shadow,
              blurRadius: 16,
              offset: Offset(0, 5),
            )
          ]),
      child: TextField(
        maxLines: 4,
        autofocus: false,
        decoration: InputDecoration(
          hintText: 'Type something ...',
          hintStyle: const TextStyle(
            color: AppColors.textAccent,
            fontSize: 18,
            fontWeight: FontWeight.w100,
          ),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.white),
          ),
          contentPadding: const EdgeInsets.all(18),
        ),
        onChanged: (value) =>
            ref.watch(leaveReasonProvider.notifier).state = value,
      ),
    );
  }
}
