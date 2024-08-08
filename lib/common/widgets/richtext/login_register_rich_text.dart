import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class ULoginRegisterRichText extends StatelessWidget {
  const ULoginRegisterRichText({
    super.key,
    required this.text,
    required this.addText,
  });

  final String text, addText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {},
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
