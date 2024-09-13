import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:up_todo/src/utils/constants/colors.dart';
import 'package:up_todo/src/utils/constants/sizes.dart';

/// -- Custom AppBar
class UAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UAppBar({
    super.key,
    this.showBackArrow = false,
    this.title,
    this.leadingIcon,
    this.actions,
    this.onPressed,
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: USizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(IconsaxPlusLinear.arrow_left_1),
              )
            : leadingIcon != null
                ? IconButton(
                    onPressed: onPressed,
                    icon: Icon(
                      leadingIcon,
                      color: UColors.white,
                    ),
                  )
                : null,
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(USizes.appBarHeight);
}
