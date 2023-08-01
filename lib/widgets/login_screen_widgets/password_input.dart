import 'package:cobe_hive_mobile_app/data/constants/app_colors.dart';
import 'package:cobe_hive_mobile_app/providers/login_screen_providers/is_password_visible_provider.dart';
import 'package:cobe_hive_mobile_app/providers/login_screen_providers/password_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PasswordInput extends ConsumerWidget {
  const PasswordInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isVisible = ref.watch(isPasswordVisibleProvider);
    return SizedBox(
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child:
                Text('Password', style: Theme.of(context).textTheme.bodySmall),
          ),
          TextField(
            onChanged: (value) =>
                ref.read(passwordProvider.notifier).state = value,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.widgetBackground,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.accent),
              ),
              suffixIcon: IconButton(
                onPressed: () => ref
                    .read(isPasswordVisibleProvider.notifier)
                    .state = !isVisible,
                icon: isVisible
                    ? const Icon(
                        Icons.visibility_off,
                        color: AppColors.accent,
                      )
                    : const Icon(
                        Icons.visibility,
                        color: AppColors.accent,
                      ),
              ),
            ),
            obscureText: isVisible,
            enableSuggestions: false,
            autocorrect: false,
          ),
        ],
      ),
    );
  }
}
