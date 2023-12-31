import 'package:cobe_hive_mobile_app/data/constants/app_colors.dart';
import 'package:cobe_hive_mobile_app/capitalize_string.dart';
import 'package:cobe_hive_mobile_app/data/models/leave_request.dart';
import 'package:cobe_hive_mobile_app/providers/create_request_screen_providers/view_permission_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ViewPermissionSelector extends ConsumerWidget {
  const ViewPermissionSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewPermission = ref.watch(viewPermissionProvider);
    const viewPermissionValues = ViewPermission.values;
    return SizedBox(
      height: 200,
      child: ListView.builder(
        itemCount: viewPermissionValues.length,
        itemBuilder: (itemBuilderContext, index) {
          final viewPermissionValue = viewPermissionValues[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: RadioListTile(
              controlAffinity: ListTileControlAffinity.trailing,
              value: viewPermissionValue,
              groupValue: viewPermission,
              onChanged: (ViewPermission? value) =>
                  ref.read(viewPermissionProvider.notifier).state = value!,
              tileColor: AppColors.widgetBackground,
              activeColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              title: Text(
                viewPermissionValue.name.toString().capitalize(),
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              subtitle: const Text('Text here',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textAccent,
                  )),
            ),
          );
        },
      ),
    );
  }
}
