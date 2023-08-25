import 'package:cobe_hive_mobile_app/data/constants/app_colors.dart';
import 'package:cobe_hive_mobile_app/providers/network_providers/logged_in_user_provider.dart';
import 'package:cobe_hive_mobile_app/providers/network_providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginButton extends ConsumerWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(loginProvider, (_, state) {
      state.maybeWhen(
        error: (message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message),
              backgroundColor: Colors.red,
            ),
          );
        },
        orElse: () {},
      );
    });
    ref.listen(loggedInUserNotifierProvider, (_, state) {
      state.maybeWhen(
        success: (user) {
          if (user.isAdmin!) {
            Navigator.pushNamed(context, '/admin-home-screen');
          } else {
            Navigator.pushNamed(context, '/home');
          }
        },
        orElse: () {},
      );
    });

    return Container(
      height: 50,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: AppColors.orangeGradient,
        boxShadow: const [
          BoxShadow(
            color: AppColors.orangeShadow,
            offset: Offset(0, 4),
            blurRadius: 28,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () => ref.read(loginProvider.notifier).login(),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent),
        child: Text(
          ref.watch(loginProvider).maybeWhen(
                loading: (_) => 'Logging in...',
                orElse: () => 'Login',
              ),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
