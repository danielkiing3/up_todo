import 'package:flutter/material.dart';

class USectionHeading extends StatelessWidget {
  const USectionHeading({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }
}
