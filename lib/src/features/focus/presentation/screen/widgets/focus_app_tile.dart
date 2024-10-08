import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:up_todo/src/common/widgets/divider/vertical_divider.dart';
import 'package:up_todo/src/features/focus/models/app_usage/app_usage_model.dart';
import 'package:up_todo/src/utils/constants/colors.dart';
import 'package:up_todo/src/utils/formatters/string_formatter.dart';

class FocusAppTile extends StatelessWidget {
  const FocusAppTile({
    super.key,
    required this.app,
  });

  final AppUsageModel app;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: UColors.darkGrey,
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          app.appIconByte != null
              ? Image.memory(
                  app.appIconByte!,
                  width: 34,
                )
              : const Text(''),
          const SizedBox(width: 10),

          // Title and Description
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  UStringFormatter.formatAppNameString(app.appName),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 8),
                Text(
                  'You spent ${UStringFormatter.formatTime(app.duration.inSeconds / 3600)} on ${app.appName} today',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelLarge,
                )
              ],
            ),
          ),
          const UVerticalDivider(),

          // -- Info Button
          const Expanded(
            flex: 1,
            child: Icon(
              IconsaxPlusLinear.info_circle,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
