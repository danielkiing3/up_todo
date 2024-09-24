import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/web.dart';
import 'package:up_todo/src/features/authenication/presentation/screens/login/login.dart';
import 'package:up_todo/src/features/authenication/presentation/screens/register/register.dart';
import 'package:up_todo/src/features/personalization/screens/profile/settings.dart';
import 'package:up_todo/src/features/todo/presentation/screens/add_task/create_category_widget/create_category_page.dart';
import 'package:up_todo/src/features/todo/presentation/screens/navigation/navigation_menu.dart';
import 'package:up_todo/src/utils/constants/routes.dart';
import 'package:up_todo/src/utils/routing/routing_provider.dart';

import '../../features/authenication/presentation/screens/onboarding/on_boarding.dart';
import '../../features/authenication/presentation/screens/onboarding/start.dart';

var logger = Logger();

// Gorouter configuration
final router = GoRouter(
  initialLocation: '/',
  // initialLocation: '/start_screen',
  // TODO: Fix the redirect issue
  // redirect: (_, state) async {
  //   User? user = FirebaseAuth.instance.currentUser;

  //   if (user != null) {
  //     print(user);
  //     // If the user is logged in, redirect to the home screen (e.g., '/')
  //     return '/';
  //   } else if (user == null && state.matchedLocation != '/onboarding') {
  //     // If user is not logged in, and they're not already on the onboarding screen, redirect to onboarding
  //     return '/onboarding';
  //   }

  //   // Return null if no redirection is needed
  //   return null;
  // },
  routes: [
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

    // Main App Route
    GoRoute(
        name: URoutes.homeScreen,
        path: '/',
        builder: (context, state) => const NavigationMenu(),
        routes: [
          GoRoute(
            path: 'settings',
            name: URoutes.settingsScreen,
            builder: (context, state) => const AppSettingsScreen(),
          ),
        ]),

    GoRoute(
      name: URoutes.createCategoryScreen,
      path: '/create_category',
      builder: (context, state) => const CreateCategoryPage(),
    ),
  ],
);

// This is super important - otherwise, we would throw away the whole widget tree when the provider is updated.
final _navigatorKey = GlobalKey<NavigatorState>();

GoRouter? _previousRouter;

final routerProvider = Provider((ref) {
  return GoRouter(
    initialLocation: '/start_screen',
    navigatorKey: _navigatorKey,
    routes: [
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

      // Main App Route
      GoRoute(
        path: '/',
        builder: (context, state) => const NavigationMenu(),
      )
    ],
    redirect: (_, state) {
      final isFirstTime = ref.read(isFirstTimeProvider).value ?? false;
      logger.w('FirsTime: $isFirstTime');
      if (isFirstTime) {
        return '/onboarding';
      }

      final authState = ref.read(authProvider);
      if (authState.isLoading || authState.hasError) return null;

      final isAuthenticated = authState.valueOrNull != null;
      // final isAuthenticating =
      // state.matchedLocation == '/onboaring/start_screen';

      if (isAuthenticated) {
        return '/';
      }

      // if (isAuthenticating) {
      //   return '/';
      // }

      return null;
    },
  );
});
