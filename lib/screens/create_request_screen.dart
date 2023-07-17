import 'package:cobe_hive_mobile_app/app_colors.dart';
import 'package:cobe_hive_mobile_app/widgets/create_request_buttons.dart';
import 'package:cobe_hive_mobile_app/widgets/create_request_header.dart';
import 'package:cobe_hive_mobile_app/widgets/date_picker.dart';
import 'package:cobe_hive_mobile_app/widgets/type_of_leave_selector.dart';
import 'package:cobe_hive_mobile_app/widgets/view_permission_selector.dart';
import 'package:flutter/material.dart';

class CreateRequestScreen extends StatelessWidget {
  const CreateRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: const Scaffold(
        body: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.only(left: 18, right: 18, bottom: 40, top: 18),
              child: CreateRequestHeader(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: TypeOfLeaveSelector(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
              child: DatePicker(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
              child:
                  Align(alignment: Alignment.centerLeft, child: Text('Reason')),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: _LeaveReasonTextField(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 18),
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
    );
  }
}

class _LeaveReasonTextField extends StatelessWidget {
  const _LeaveReasonTextField();

  @override
  Widget build(BuildContext context) {
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
      ),
    );
  }
}
