import 'package:cobe_hive_mobile_app/leave_request.dart';
import 'package:cobe_hive_mobile_app/widgets/expandable_fab.dart';
import 'package:cobe_hive_mobile_app/widgets/leave_request_status_card.dart';
import 'package:flutter/material.dart';

class RequestDetailsScreen extends StatelessWidget {
  const RequestDetailsScreen({super.key, required this.leaveRequest});
  final LeaveRequest leaveRequest;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20, left: 18, right: 18, bottom: 40),
            child: _RequestDetailsHeader(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/ronalds.png',
              ),
              const SizedBox(width: 15),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ronald Richards',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Software Engineer',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 30),
          LeaveRequestStatusCard(leaveRequest: leaveRequest),
        ],
      ),
      floatingActionButton: const ExpandableFAB(),
    );
  }
}

class _RequestDetailsHeader extends StatelessWidget {
  const _RequestDetailsHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: Navigator.of(context).pop,
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        Expanded(
          child: Container(),
        ),
        Text(
          'Request Details',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Expanded(
          flex: 2,
          child: Container(),
        ),
      ],
    );
  }
}
