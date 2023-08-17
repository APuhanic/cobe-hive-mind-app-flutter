import 'package:cobe_hive_mobile_app/data/constants/endpoints.dart';
import 'package:cobe_hive_mobile_app/data/models/user.dart';
import 'package:flutter/material.dart';

class BackgroundProfileImage extends StatelessWidget {
  final double radius;

  const BackgroundProfileImage({
    super.key,
    required this.user,
    this.radius = 0,
  });

  final User? user;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(radius),
          bottomRight: Radius.circular(radius),
        ),
        image: DecorationImage(
          image: NetworkImage('${Endpoints.baseUrl}${user!.imageUrl}'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
