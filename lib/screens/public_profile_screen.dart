import 'package:cobe_hive_mobile_app/providers/network_providers/selected_user_provider.dart';
import 'package:cobe_hive_mobile_app/widgets/profile_screen_widgets/background_profile_image.dart';
import 'package:cobe_hive_mobile_app/widgets/profile_screen_widgets/profile_info_card.dart';
import 'package:cobe_hive_mobile_app/widgets/profile_screen_widgets/headers/public_profile_screen_header.dart';
import 'package:flutter/material.dart';
import 'package:cobe_hive_mobile_app/widgets/expandable_fab.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PublicProfileScreen extends ConsumerWidget {
  const PublicProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(selectedUserProvider);

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
                    child: PublicProfileScreenHeader(),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.25),
                  ProfileInfoCard(user),
                ],
              )
            ],
          ),
        ],
      ),
      floatingActionButton: const ExpandableFAB(),
    );
  }
}
