import 'package:cobe_hive_mobile_app/providers/network_providers/logged_in_user_provider.dart';
import 'package:cobe_hive_mobile_app/widgets/profile_screen_widgets/background_profile_image.dart';
import 'package:cobe_hive_mobile_app/widgets/profile_screen_widgets/headers/private_profile_screen_header.dart';
import 'package:cobe_hive_mobile_app/widgets/profile_screen_widgets/number_of_sick_leave_days.dart';
import 'package:cobe_hive_mobile_app/widgets/profile_screen_widgets/number_of_vacation_days.dart';
import 'package:cobe_hive_mobile_app/widgets/profile_screen_widgets/profile_info_card.dart';
import 'package:flutter/material.dart';
import 'package:cobe_hive_mobile_app/widgets/expandable_fab.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PrivateProfileScreen extends ConsumerWidget {
  const PrivateProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(loggedInUserProvider);

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              BackgroundProfileImage(user: user),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: PrivateProfileScreenHeader(),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.25),
                  ProfileInfoCard(user!),
                ],
              )
            ],
          ),
          const SizedBox(height: 25),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NumberOfVacationDays(),
              SizedBox(width: 15),
              NumberOfSickLeaveDays()
            ],
          )
        ],
      ),
      floatingActionButton: const ExpandableFAB(),
    );
  }
}
