import 'package:cobe_hive_mobile_app/data/constants/app_colors.dart';
import 'package:cobe_hive_mobile_app/data/models/user.dart';
import 'package:cobe_hive_mobile_app/providers/network_providers/login_provider.dart';
import 'package:cobe_hive_mobile_app/widgets/profile_screen_widgets/background_profile_image.dart';
import 'package:cobe_hive_mobile_app/widgets/profile_screen_widgets/headers/edit_profile_screen_header.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EditProfileScreen extends ConsumerWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(loginProvider).user;

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              BackgroundProfileImage(
                user: user,
                radius: 21,
              ),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: EditProfileScreenHeader(),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.3),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: FilledButton(
                        onPressed: () {},
                        style: FilledButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: AppColors.buttonTransparent,
                        ),
                        child: const Text(
                          'Change Image',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Divider(
                    thickness: 1,
                    color: AppColors.accent,
                  ),
                  _JobTitleField(user: user),
                  const Divider(
                    thickness: 1,
                    color: AppColors.accent,
                  ),
                  _PhoneNumberField(user: user),
                  const Divider(
                    thickness: 1,
                    color: AppColors.accent,
                  ),
                  _EmailField(user: user),
                  const Divider(
                    thickness: 1,
                    color: AppColors.accent,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _JobTitleField extends StatelessWidget {
  const _JobTitleField({
    required this.user,
  });

  final User? user;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Job Title',
                style: TextStyle(fontSize: 22),
              ),
              const SizedBox(height: 5),
              Text(
                '${user?.role}',
                style: const TextStyle(
                  fontSize: 17,
                  color: AppColors.textAccent,
                ),
              ),
            ],
          ),
        ),
        Expanded(child: Container()),
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.09,
            height: MediaQuery.of(context).size.height * 0.09,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.widgetBackground,
            ),
            child: IconButton(
              icon: const Icon(Icons.edit_rounded),
              onPressed: () {},
              color: AppColors.accent,
            ),
          ),
        ),
      ],
    );
  }
}

class _PhoneNumberField extends StatelessWidget {
  const _PhoneNumberField({
    required this.user,
  });

  final User? user;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Phone Number',
                style: TextStyle(fontSize: 22),
              ),
              const SizedBox(height: 5),
              Text(
                '${user?.phone}',
                style: const TextStyle(
                  fontSize: 17,
                  color: AppColors.textAccent,
                ),
              ),
            ],
          ),
        ),
        Expanded(child: Container()),
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.09,
            height: MediaQuery.of(context).size.height * 0.09,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.widgetBackground,
            ),
            child: IconButton(
              icon: const Icon(Icons.edit_rounded),
              onPressed: () {},
              color: AppColors.accent,
            ),
          ),
        ),
      ],
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField({
    required this.user,
  });

  final User? user;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Email',
                style: TextStyle(fontSize: 22),
              ),
              const SizedBox(height: 5),
              Text(
                '${user?.email}',
                style: const TextStyle(
                  fontSize: 17,
                  color: AppColors.textAccent,
                ),
              ),
            ],
          ),
        ),
        Expanded(child: Container()),
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.09,
            height: MediaQuery.of(context).size.height * 0.09,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.widgetBackground,
            ),
            child: IconButton(
              icon: const Icon(Icons.edit_rounded),
              onPressed: () {},
              color: AppColors.accent,
            ),
          ),
        ),
      ],
    );
  }
}
