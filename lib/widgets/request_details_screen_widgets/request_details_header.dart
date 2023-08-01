import 'package:flutter/material.dart';

class RequestDetailsHeader extends StatelessWidget {
  const RequestDetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: Navigator.of(context).pop,
          icon: const Icon(Icons.arrow_back_ios),
        ),
        Expanded(
          child: Container(),
        ),
        Text(
          'Request Details',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Expanded(
          flex: 2,
          child: Container(),
        ),
      ],
    );
  }
}
