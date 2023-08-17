import 'package:cobe_hive_mobile_app/data/constants/app_colors.dart';
import 'package:flutter/material.dart';

class DatePicker extends StatelessWidget {
  const DatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              'Date',
              style: TextStyle(
                color: AppColors.textAccent,
                fontSize: 18,
                fontWeight: FontWeight.w100,
              ),
            ),
          ),
          Text(
            '00/00/0000-00/00/0000',
            style: Theme.of(context).textTheme.labelMedium,
          )
        ],
      ),
    );
  }
}
