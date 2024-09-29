import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:up_todo/src/features/authenication/presentation/screens/login/login.dart';
import 'package:up_todo/src/features/authenication/presentation/screens/register/register.dart';
import 'package:up_todo/src/features/personalization/screens/profile/profile.dart';
import 'package:up_todo/src/features/personalization/screens/profile/settings.dart';
import 'package:up_todo/src/features/todo/presentation/screens/add_task_popup/create_category_widget/create_category_page.dart';
import 'package:up_todo/src/features/todo/presentation/screens/calender/calender.dart';
import 'package:up_todo/src/features/todo/presentation/screens/edit_task/edit_task.dart';
import 'package:up_todo/src/features/todo/presentation/screens/focus/focus.dart';
import 'package:up_todo/src/features/todo/presentation/screens/index/index.dart';
import 'package:up_todo/main_app_screen.dart';
import 'package:up_todo/src/utils/constants/routes.dart';

import '../../features/authenication/presentation/screens/onboarding/on_boarding.dart';
import '../../features/authenication/presentation/screens/onboarding/start.dart';

// Create keys for `root` & `section` navigator avoiding unnecessary rebuilds
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorKey = GlobalKey<NavigatorState>();

// Gorouter configuration
final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  // initialLocation: '/onboarding',
  routes: <RouteBase>[
    // Onboarding Route
    GoRoute(
      name: URoutes.onboarding,
      path: '/onboarding',
      builder: (context, state) => const OnBoardingScreen(),
    ),

    // Authenication Route
    GoRoute(
      name: URoutes.startScreen,
      path: '/start_screen',
      builder: (context, state) => const StartScreen(),
      routes: [
        GoRoute(
          name: URoutes.loginScreen,
          path: 'login_screen',
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          name: URoutes.createAccountScreen,
          path: 'register_screen',
          builder: (context, state) => const RegisterScreen(),
        ),
      ],
    ),

    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainAppScreen(navigationShell);
      },
      branches: <StatefulShellBranch>[
        // -- Index
        StatefulShellBranch(
          navigatorKey: _sectionNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              name: URoutes.indexScreen,
              path: '/',
              builder: (context, state) => const IndexScreen(),
            )
          ],
        ),

        // -- Calender
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: URoutes.calenderScreen,
              path: '/calender',
              builder: (context, state) => const CalenderScreen(),
            )
          ],
        ),

        // -- Focus
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: URoutes.focusScreen,
              path: '/focus',
              builder: (context, state) => const FocusScreen(),
            )
          ],
        ),

        // -- Profile
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: URoutes.profileScreen,
              path: '/profile',
              builder: (context, state) => const ProfileScreen(),
            )
          ],
        ),
      ],
    ),

    // Settings

    GoRoute(
      path: '/settings',
      name: URoutes.settingsScreen,
      builder: (context, state) => const AppSettingsScreen(),
    ),
    GoRoute(
      path: '/edit_task',
      name: URoutes.editTaskScreen,
      builder: (context, state) => const EditTaskScreen(),
    ),

    GoRoute(
      name: URoutes.createCategoryScreen,
      path: '/create_category',
      builder: (context, state) => const CreateCategoryPage(),
    ),
  ],
);
