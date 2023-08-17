import 'package:cobe_hive_mobile_app/data/constants/app_colors.dart';
import 'package:flutter/material.dart';

class LeaveDate extends StatelessWidget {
  const LeaveDate({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'FROM',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 20),
              Text(
                'TO',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(width: 20),
          Column(
            children: [
              Text(
                'Friday 14 October 2022 ・08:00',
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.textAccent,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Friday 14 October 2022 ・08:00',
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.textAccent,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
