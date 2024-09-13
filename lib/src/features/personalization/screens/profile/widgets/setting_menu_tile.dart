import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:up_todo/src/utils/constants/colors.dart';

/// Setting menu tile widget that displays a leading icon, title text and shows
/// a trailling conditionally depending on the value of [isLogout] and shows
class USettingMenuTile extends StatelessWidget {
  const USettingMenuTile({
    super.key,
    required this.leadingIcon,
    required this.title,
    this.isLogout = false,
    required this.onTap,
  });

  final IconData leadingIcon;
  final String title;
  final bool isLogout;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(
        leadingIcon,
        color: isLogout ? UColors.error : null,
      ),
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: isLogout ? UColors.error : null),
      ),
      trailing: isLogout ? null : const Icon(IconsaxPlusLinear.arrow_right_3),
      onTap: onTap,
    );
  }
}
