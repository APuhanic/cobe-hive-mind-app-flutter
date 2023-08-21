import 'package:cobe_hive_mobile_app/widgets/create_request_widgets/leave_reason_text_field.dart';
import 'package:flutter/material.dart';

class LeaveReason extends StatelessWidget {
  const LeaveReason({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text('Reason'),
          ),
        ),
        LeaveReasonTextField(),
      ],
    );
  }
}
