import 'package:flutter/material.dart';

class CobeSearchBar extends StatelessWidget {
  const CobeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(58, 73, 88, 0.08),
            offset: Offset(0, 2),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: const TextField(
        decoration: InputDecoration(
          labelText: 'Search...',
          labelStyle: TextStyle(
            color: Color.fromRGBO(188, 196, 220, 1),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Color.fromRGBO(188, 196, 220, 1),
          ),
          border: InputBorder.none,
          iconColor: Color.fromRGBO(188, 196, 220, 1),
        ),
      ),
    );
  }
}
