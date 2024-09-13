import 'package:flutter/material.dart';

import '../../utils/constants/sizes.dart';

/// -- Custom spacing styles
class USpacingStyles {
  USpacingStyles._();

  static const EdgeInsets paddingWithAppbarHeight = EdgeInsets.only(
    top: USizes.appBarHeight,
    left: USizes.smallDefaultSpace,
    right: USizes.smallDefaultSpace,
  );
}
