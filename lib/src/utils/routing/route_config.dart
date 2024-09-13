import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:up_todo/src/features/authenication/presentation/screens/login/login.dart';
import 'package:up_todo/src/features/authenication/presentation/screens/register/register.dart';
import 'package:up_todo/src/features/todo/screens/navigation/navigation_menu.dart';
import 'package:up_todo/src/utils/constants/routes.dart';
import 'package:up_todo/src/utils/routing/routing_provider.dart';

import '../../features/authenication/presentation/screens/onboarding/on_boarding.dart';
import '../../features/authenication/presentation/screens/onboarding/start.dart';

// Gorouter configuration
final router = GoRouter(
  initialLocation: '/onboarding',
  // TODO: Fix the redirect issue
  // redirect: (context, state) {
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
    )
  ],
);

// // This is super important - otherwise, we would throw away the whole widget tree when the provider is updated.
// final _navigatorKey = GlobalKey<NavigatorState>();

// final routerProvider = Provider((ref) {
//   final authState = ref.watch(authProvider);
//   final isFirstTime = ref.read(isFirstTimeProvider);

//   return GoRouter(
//     initialLocation: '/onboarding',
//     navigatorKey: _navigatorKey,
//     routes: [
//       // Onboarding Route
//       GoRoute(
//         name: URoutes.onboarding,
//         path: '/onboarding',
//         builder: (context, state) => const OnBoardingScreen(),
//       ),

//       // Authenication Route
//       GoRoute(
//         name: URoutes.startScreen,
//         path: '/start_screen',
//         builder: (context, state) => const StartScreen(),
//         routes: [
//           GoRoute(
//             name: URoutes.loginScreen,
//             path: 'login_screen',
//             builder: (context, state) => const LoginScreen(),
//           ),
//           GoRoute(
//             name: URoutes.createAccountScreen,
//             path: 'register_screen',
//             builder: (context, state) => const RegisterScreen(),
//           ),
//         ],
//       ),

//       // Main App Route
//       GoRoute(
//         path: '/',
//         builder: (context, state) => const NavigationMenu(),
//       )
//     ],
//     redirect: (context, state) {
//       // If our async state is loading, don't perform redirects, yet
//       if (authState.isLoading || authState.hasError) return null;
//       //TODO: Unlock the splash screen here

//       // This has to do with how the FirebaseAuth SDK handles the "log-in" state
//       // Returning `null` means "we are not authorized"
//       final isAuth = authState.valueOrNull != null;

//       final isOnboarding = state.matchedLocation == '/onboarding';
//       if (isOnboarding) {
//         isFirstTime.when(data: data, error: error, loading: loading)
//       }
//     },
//   );
// });
