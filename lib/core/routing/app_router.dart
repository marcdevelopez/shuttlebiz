import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

/// Central routing configuration for ShuttleBiz app
///
/// This class manages all navigation between screens using GoRouter.
/// It defines the app's navigation structure and handles route transitions.
///
/// Key features:
/// - Declarative routing with named routes
/// - Authentication-based route guards (to be implemented)
/// - Deep linking support
/// - Navigation state management
class AppRouter {
  /// Main router instance used throughout the app
  ///
  /// Routes are organized by main app sections:
  /// - /auth: Authentication flow (login, SMS verification)
  /// - /onboarding: First-time user tutorial
  /// - /home: Main app with groups and shuttles
  /// - /groups: Group management screens
  /// - /shuttles: Shuttle creation and booking
  static final GoRouter router = GoRouter(
    // Starting point of the app - will redirect based on auth state
    initialLocation: '/auth',

    // Route definitions - each represents a screen or section
    routes: [
      // Authentication section
      GoRoute(
        path: '/auth',
        name: 'auth',
        builder: (context, state) =>
            const Placeholder(), // TODO: Replace with AuthScreen
      ),

      // First-time user tutorial
      GoRoute(
        path: '/onboarding',
        name: 'onboarding',
        builder: (context, state) =>
            const Placeholder(), // TODO: Replace with OnboardingScreen
      ),

      // Main app home with groups and shuttles
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) =>
            const Placeholder(), // TODO: Replace with HomeScreen
      ),

      // TODO: Add more routes as features are developed:
      // - /groups/:groupId - Group details and management
      // - /shuttles/:shuttleId - Shuttle booking and details
      // - /profile - User profile and settings
    ],

    // TODO: Add route guards for authentication
    // redirect: (context, state) => _handleAuthRedirect(context, state),
  );

  // TODO: Implement authentication-based redirects
  // static String? _handleAuthRedirect(BuildContext context, GoRouterState state) {
  //   final isAuthenticated = context.read<AuthProvider>().isAuthenticated;
  //   if (!isAuthenticated && state.location != '/auth') {
  //     return '/auth';
  //   }
  //   return null;
  // }
}
