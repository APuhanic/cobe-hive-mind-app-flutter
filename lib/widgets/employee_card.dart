import 'package:flutter/material.dart';

class EmployeeCard extends StatelessWidget {
  EmployeeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 255, 255, 1),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(58, 73, 88, 0.08),
              blurRadius: 10.0,
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Container(
                child: Image.asset(
                  'images/profile_photo_employee.png',
                  width: 80,
                  height: 80,
                ),
              ),
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name and Surname",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(61, 71, 102, 1),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Text here",
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromRGBO(188, 196, 220, 1),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
