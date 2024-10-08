import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:up_todo/src/features/focus/models/app_usage/app_usage_model.dart';
import 'package:up_todo/src/features/focus/presentation/controller/app_usage_provider.dart';
import 'package:up_todo/src/features/focus/presentation/controller/timer_provider.dart';
import 'package:up_todo/src/features/focus/presentation/screen/widgets/focus_app_tile.dart';
import 'package:up_todo/src/features/focus/presentation/screen/widgets/focus_bar_chart.dart';
import 'package:up_todo/src/features/focus/presentation/screen/widgets/foucs_timer.dart';

class FocusScreen extends ConsumerWidget {
  const FocusScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appUsageList = ref.watch(appUsageProvider);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // -- App Bar
          const SliverAppBar(
            title: Center(
              child: Text('Focus Mode'),
            ),
            backgroundColor: Colors.black,
            pinned: true,
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: 30),
          ),

          // -- Timer Portion
          const SliverToBoxAdapter(child: FoucsTimer()),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Text(
                'While your focus mode is on, all of your notifications will be off',
                textAlign: TextAlign.center,
              ),
            ),
          ),

          // -- Start Focusing Button
          SliverToBoxAdapter(
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  ref
                      .read(timerProvider.notifier)
                      .startTimer(); // Resume the timer

                  // ref
                  //     .read(timerProvider.notifier)
                  //     .pauseTimer(); // Pause the timer
                },
                child: const Text('Stop Focusing'),
              ),
            ),
          ),

          // -- Overview Tag
          SliverToBoxAdapter(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, top: 20, bottom: 20),
                child: Text(
                  'Overview',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(
              height: 280,
              child: FocusBarChart(),
            ),
          ),

          // -- Application Tag
          SliverToBoxAdapter(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, top: 20, bottom: 20),
                child: Text(
                  'Application',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
          ),

          // -- App Usage Content
          appUsageList.when(
            data: (List<AppUsageModel> appUsage) {
              return SliverList.separated(
                itemCount: appUsage.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final app = appUsage[index];

                  return FocusAppTile(app: app);
                },
              );
            },
            error: (error, stackTrace) {
              return const SliverFillRemaining(
                child: Center(
                  child: Text(
                    "Unable to fetch app Data",
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
            loading: () => const SliverFillRemaining(
                child: Center(child: CircularProgressIndicator())),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: 60),
          ),
        ],
      ),
    );
  }
}
