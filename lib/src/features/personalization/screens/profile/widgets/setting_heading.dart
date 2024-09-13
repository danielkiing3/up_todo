import 'package:flutter/material.dart';

class USettingHeading extends StatelessWidget {
  const USettingHeading({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 14));
  }
}
