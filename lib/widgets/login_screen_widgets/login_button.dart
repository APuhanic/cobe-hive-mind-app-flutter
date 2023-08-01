import 'package:cobe_hive_mobile_app/data/constants/app_colors.dart';
import 'package:cobe_hive_mobile_app/providers/network_providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginButton extends ConsumerWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        onPressed: () {
          ref.read(loginProvider.notifier).login().then(
            (value) {
              if (value.statusCode == 200) {
                Navigator.pushNamed(context, '/home');
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Invalid credentials'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
          );
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent),
        child: const Text(
          'Login',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
    );
  }
}
