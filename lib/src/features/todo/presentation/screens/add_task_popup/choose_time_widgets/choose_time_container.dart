import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:up_todo/src/features/todo/presentation/controllers/add_task_popup/choose_time_provider.dart';
import 'package:up_todo/src/utils/constants/colors.dart';
import 'package:up_todo/src/utils/constants/sizes.dart';

class ChooseTimeContainer extends ConsumerWidget {
  const ChooseTimeContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // -- Hour
        Container(
          decoration: BoxDecoration(
              color: UColors.darkestGrey,
              borderRadius: BorderRadius.circular(6)),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 90, maxWidth: 80),
            child: ListWheelScrollView.useDelegate(
              itemExtent: 30,
              useMagnifier: true,
              magnification: 1.5,
              overAndUnderCenterOpacity: 0.2,
              controller: ref.read(chooseTimeProvider.notifier).hourController,
              childDelegate: ListWheelChildListDelegate(
                children: Iterable<int>.generate(12)
                    .toList()
                    .map((hour) => Text((hour).toString().padLeft(2, '0')))
                    .toList(),
              ),
            ),
          ),
        ),
        const SizedBox(width: USizes.md),

        // Dot
        Text(':', style: Theme.of(context).textTheme.headlineLarge),
        const SizedBox(width: USizes.md),

        // -- Minute
        Container(
          decoration: BoxDecoration(
              color: UColors.darkestGrey,
              borderRadius: BorderRadius.circular(USizes.sm)),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 90, maxWidth: 80),
            child: ListWheelScrollView.useDelegate(
              itemExtent: 30,
              useMagnifier: true,
              magnification: 1.5,
              controller:
                  ref.read(chooseTimeProvider.notifier).minuteController,
              overAndUnderCenterOpacity: 0.2,
              childDelegate: ListWheelChildListDelegate(
                children: Iterable.generate(60)
                    .toList()
                    .map((hour) => Text((hour).toString().padLeft(2, '0')))
                    .toList(),
              ),
            ),
          ),
        ),
        const SizedBox(width: USizes.md),

        // -- AM / PM
        Container(
          decoration: BoxDecoration(
              color: UColors.darkestGrey,
              borderRadius: BorderRadius.circular(USizes.sm)),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 90, maxWidth: 80),
            child: ListWheelScrollView(
              controller: ref.read(chooseTimeProvider.notifier).amPmController,
              itemExtent: 30,
              useMagnifier: true,
              magnification: 1.5,
              overAndUnderCenterOpacity: 0.2,
              children: [
                'AM',
                "PM",
              ].map((time) => Text(time)).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
