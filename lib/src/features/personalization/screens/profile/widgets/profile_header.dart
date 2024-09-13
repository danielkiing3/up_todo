import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';

class UProfileHeader extends StatelessWidget {
  const UProfileHeader({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Center(
      // To send the widget
      child: Column(
        children: [
          Text(UTexts.profile, style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(height: USizes.defaultSpace),

          // Profile Picture
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(image),
          ),
          const SizedBox(height: USizes.defaultSpace),

          Text(UTexts.placeholdeerUser,
              style: Theme.of(context).textTheme.titleSmall),
        ],
      ),
    );
  }
}
