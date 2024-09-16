import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/constants/colors.dart';

class ULoginRegisterRichText extends StatelessWidget {
  const ULoginRegisterRichText({
    super.key,
    required this.text,
    required this.addText,
    required this.location,
  });

  final String text, addText;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        // Navigate to the login screen
        onTap: () => context.pushReplacementNamed(location),
        child: RichText(
          text: TextSpan(
              text: text,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .apply(color: UColors.borderPrimary),
              children: [
                TextSpan(
                  text: addText,
                  style: Theme.of(context).textTheme.labelLarge,
                )
              ]),
        ),
      ),
    );
  }
}
