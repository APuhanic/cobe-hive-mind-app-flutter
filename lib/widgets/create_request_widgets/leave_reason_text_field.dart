import 'package:cobe_hive_mobile_app/data/constants/app_colors.dart';
import 'package:cobe_hive_mobile_app/providers/create_request_screen_providers/leave_reason_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LeaveReasonTextField extends ConsumerWidget {
  const LeaveReasonTextField({super.key});

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
