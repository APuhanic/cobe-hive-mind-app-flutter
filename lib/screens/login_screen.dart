import 'package:cobe_hive_mobile_app/data/constants/app_colors.dart';
import 'package:cobe_hive_mobile_app/providers/login_screen_providers/email_provider.dart';
import 'package:cobe_hive_mobile_app/providers/login_screen_providers/is_password_visible_provider.dart';
import 'package:cobe_hive_mobile_app/providers/network_providers/login_provider.dart';
import 'package:cobe_hive_mobile_app/providers/login_screen_providers/password_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 90),
              Image.asset(
                'images/Logo_red.png',
              ),
              Text(
                'Hive',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 40),

              const _EmailInput(),

              const _PasswordInput(),
              const SizedBox(height: 30),

              _LoginButton(),

              // Forgot password button
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Reset your password?',
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColors.textOrange,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginButton extends ConsumerWidget {
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

class _PasswordInput extends ConsumerWidget {
  const _PasswordInput();

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
                icon: const Icon(Icons.visibility, color: AppColors.accent),
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

class _EmailInput extends ConsumerWidget {
  const _EmailInput();

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
            onChanged: (value) {
              ref.read(emailProvider.notifier).state = value;
            },
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
