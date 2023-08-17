import 'package:cobe_hive_mobile_app/data/constants/app_colors.dart';
import 'package:cobe_hive_mobile_app/providers/login_screen_providers/email_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EmailInput extends ConsumerWidget {
  const EmailInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text('Email', style: Theme.of(context).textTheme.bodySmall),
          ),
          TextFormField(
            onChanged: (value) =>
                ref.read(emailProvider.notifier).state = value,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.widgetBackground,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.accent),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
