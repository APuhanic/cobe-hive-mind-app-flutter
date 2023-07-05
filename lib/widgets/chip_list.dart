import 'package:flutter/material.dart';

class ChipList extends StatelessWidget {
  ChipList({super.key});
  final List<String> chipsText = [
    "All",
    "Offline",
    "Online",
    "Sick",
    "Away",
    "Vacation",
    "Parental",
    "Other"
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: chipsText.length,
      itemBuilder: (context, index) {
        return Chip(
          label: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(chipsText[index],
                style: const TextStyle(
                  color: Color.fromRGBO(188, 196, 220, 1),
                  fontSize: 18,
                  fontWeight: FontWeight.w100,
                )),
          ),
          backgroundColor:
              const Color.fromRGBO(246, 248, 252, 1), //neradi transparrent?
          shape: const StadiumBorder(
            side: BorderSide(
              color: Color.fromRGBO(188, 196, 220, 1),
              width: 1,
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(width: 10),
    );
  }
}
