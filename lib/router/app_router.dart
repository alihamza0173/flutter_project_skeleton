import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../blocs/profile_bloc.dart';
import '../blocs/singleton_bloc.dart';
import '../pages/auth/login/login_screen.dart';
import '../pages/auth/forget_password/forget_password_screen.dart';
import '../pages/home/another_screen.dart';
import '../pages/home/home_screen.dart';
import '../pages/home/profile_screen.dart';
import '../pages/onboarding/onboarding_screen.dart';
import '../pages/home/home_bottom_navigation_bar.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);

final _homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final _profileNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'profile');
final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: OnboardingScreen.ROUTE_NAME,
  routes: [
    // Onboarding Routes
    GoRoute(
      path: OnboardingScreen.ROUTE_NAME,
      name: OnboardingScreen.ROUTE_NAME,
      builder: (final context, final state) => const OnboardingScreen(),
    ),

    // Auth Routes
    GoRoute(
      path: '/auth',
      name: LoginScreen.ROUTE_NAME,
      builder: (final context, final state) => const LoginScreen(),
      routes: [
        GoRoute(
          path: ForgetPasswordScreen.ROUTE_NAME,
          name: ForgetPasswordScreen.ROUTE_NAME,
          builder: (final context, final state) => const ForgetPasswordScreen(),
        ),
      ],
    ),

    // Home Routes
    StatefulShellRoute.indexedStack(
      branches: [
        StatefulShellBranch(
          navigatorKey: _homeNavigatorKey,
          routes: [
            GoRoute(
              path: HomeScreen.ROUTE_NAME,
              name: HomeScreen.ROUTE_NAME,
              builder: (final context, final state) => const HomeScreen(),
              routes: [
                GoRoute(
                  path: AnotherScreen.ROUTE_NAME,
                  name: AnotherScreen.ROUTE_NAME,
                  builder:
                      (final context, final state) => const AnotherScreen(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _profileNavigatorKey,
          routes: [
            GoRoute(
              path: ProfileScreen.ROUTE_NAME,
              name: ProfileScreen.ROUTE_NAME,
              builder: (final context, final state) => const ProfileScreen(),
            ),
          ],
        ),
      ],
      builder: (final context, final state, final navigationShell) {
        return HomeBottomNavigationBar(
          shell: navigationShell,
          onTabSelected: (final index) {
            navigationShell.goBranch(index);
          },
          currentIndex: navigationShell.currentIndex,
        );
      },
    ),
  ],
  refreshListenable: singletonBloc.profileBloc,
  redirect: (final context, final state) {
    final bloc = ProfileBloc.of(context);
    final profile = bloc.state;
    if (profile == null) {
      if (state.uri.path.contains(OnboardingScreen.ROUTE_NAME)) {
        return null;
      }
      if (!state.uri.path.contains('auth')) {
        return '/auth';
      }
      return null;
    } else if (state.uri.path.contains('auth')) {
      return HomeScreen.ROUTE_NAME;
    }
    return null;
  },
);
