import 'package:cobe_hive_mobile_app/widgets/create_request_widgets/create_request_buttons.dart';
import 'package:cobe_hive_mobile_app/widgets/create_request_widgets/create_request_header.dart';
import 'package:cobe_hive_mobile_app/widgets/create_request_widgets/date_picker.dart';
import 'package:cobe_hive_mobile_app/widgets/create_request_widgets/leave_reason_text_field.dart';
import 'package:cobe_hive_mobile_app/widgets/create_request_widgets/type_of_leave_selector.dart';
import 'package:cobe_hive_mobile_app/widgets/create_request_widgets/view_permission_selector.dart';
import 'package:flutter/material.dart';

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
              LeaveReasonTextField(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 18),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Who can view my request?'),
                ),
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
