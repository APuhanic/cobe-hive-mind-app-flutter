import 'package:cobe_hive_mobile_app/widgets/app_header.dart';
import 'package:cobe_hive_mobile_app/widgets/chip_list.dart';
import 'package:cobe_hive_mobile_app/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String title;
  const HomeScreen({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            AppHeader(),
            Padding(
              padding:
                  EdgeInsets.only(left: 18, right: 18, top: 28, bottom: 18),
              child: CobeSearchBar(),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 18,
                right: 18,
              ),
              child: Container(
                height: 50, //zašto height?
                child: ChipList(),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(252, 68, 2, 1),
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
