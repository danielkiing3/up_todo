import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

class USocialButton extends StatelessWidget {
  const USocialButton({
    super.key,
    required this.image,
    required this.text,
    required this.onPressed,
  });

  final String image, text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// -- Logo
            Image(
              image: AssetImage(image),
            ),
            const SizedBox(width: USizes.md),

            Text(text),
          ],
        ),
      ),
    );
  }
}
