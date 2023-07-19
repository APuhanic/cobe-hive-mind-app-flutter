import 'package:flutter/material.dart';

class CreateRequestHeader extends StatelessWidget {
  const CreateRequestHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: Navigator.of(context).pop,
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        Expanded(
          child: Container(),
        ),
        Text(
          'Create Request',
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
