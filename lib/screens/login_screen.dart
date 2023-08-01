import 'package:cobe_hive_mobile_app/data/constants/app_colors.dart';
import 'package:cobe_hive_mobile_app/widgets/login_screen_widgets/email_input.dart';
import 'package:cobe_hive_mobile_app/widgets/login_screen_widgets/login_button.dart';
import 'package:cobe_hive_mobile_app/widgets/login_screen_widgets/password_input.dart';
import 'package:flutter/material.dart';

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
              Image.asset('images/Logo_red.png'),
              Text(
                'Hive',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 40),
              const EmailInput(),
              const PasswordInput(),
              const SizedBox(height: 30),
              const LoginButton(),
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
