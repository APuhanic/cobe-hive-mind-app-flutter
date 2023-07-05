import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 15, right: 15),
      child: Row(
        children: [
          Image.asset(
            'images/profile_pic.png',
          ),
          const SizedBox(width: 10),
          Text("Home", style: Theme.of(context).textTheme.bodyLarge),
          Expanded(child: Container()),
          Container(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 1),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(58, 73, 88, 0.08),
                  offset: Offset(0, 2),
                  blurRadius: 15.0,
                ),
              ],
            ),
            child: IconButton(
              onPressed: () {},
              style: IconButton.styleFrom(
                shape: const CircleBorder(),
                elevation: 20,
                backgroundColor: Colors.white,
              ),
              icon: const Icon(Icons.calendar_month_outlined),
              iconSize: 30,
            ),
          ),
          const SizedBox(width: 15),
          Container(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 1),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(58, 73, 88, 0.08),
                  offset: Offset(0, 2),
                  blurRadius: 15.0,
                ),
              ],
            ),
            child: IconButton(
              onPressed: () {},
              style: IconButton.styleFrom(
                shape: const CircleBorder(),
                elevation: 8,
                backgroundColor: Colors.white,
              ),
              icon: const Icon(Icons.notifications_outlined),
              iconSize: 30,
            ),
          ),
        ],
      ),
    );
  }
}
