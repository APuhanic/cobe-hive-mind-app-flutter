import 'package:cobe_hive_mobile_app/data/constants/app_colors.dart';
import 'package:cobe_hive_mobile_app/utils/capitalize_string.dart';
import 'package:cobe_hive_mobile_app/data/models/user.dart';
import 'package:cobe_hive_mobile_app/data/constants/endpoints.dart';
import 'package:cobe_hive_mobile_app/providers/network_providers/selected_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EmployeeCard extends HookConsumerWidget {
  final User user;
  const EmployeeCard(
    this.user, {
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isExpanded = useState(false);
    final expansionAnimationController = useAnimationController(
      duration: const Duration(milliseconds: 300),
    );

    final expansionAnimation = Tween<double>(begin: 120.0, end: 200.0).animate(
      CurvedAnimation(
        parent: expansionAnimationController,
        curve: Curves.easeOut,
      ),
    );

    return GestureDetector(
      onTap: () {
        ref.read(selectedUserProvider.notifier).state = user;
        Navigator.pushNamed(context, '/public-profile-screen');
      },
      onLongPress: () {
        isExpanded.value = !isExpanded.value;
        if (isExpanded.value) {
          expansionAnimationController.forward();
        } else {
          expansionAnimationController.reverse();
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: AnimatedBuilder(
          animation: expansionAnimation,
          builder: (context, child) => Container(
            height: expansionAnimation.value,
            decoration: BoxDecoration(
              color: AppColors.widgetBackground,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.shadow,
                  blurRadius: 10.0,
                ),
              ],
            ),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  children: [
                    _UserImage(user: user),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${user.name} ${user.surname}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: AppColors.text,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          user.status!.name.toString().capitalize(),
                          style: const TextStyle(
                            fontSize: 15,
                            color: AppColors.textAccent,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                expansionAnimationController.isCompleted
                    ? Column(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Text('View profile',
                                style: TextStyle(
                                  color: AppColors.textAccent,
                                  fontSize: 20,
                                )),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Send message',
                              style: TextStyle(
                                color: AppColors.textAccent,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _UserImage extends StatelessWidget {
  const _UserImage({
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
              '${Endpoints.baseUrl}${user.imageUrl}',
            ),
          ),
        ),
        if (user.status == UserStatus.online)
          Positioned(
            top: 5,
            right: 25,
            child: Container(
              width: 18,
              height: 18,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Container(
                  width: 14,
                  height: 14,
                  decoration: const BoxDecoration(
                    color: AppColors.green,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
