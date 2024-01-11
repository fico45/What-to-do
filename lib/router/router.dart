import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:what_to_do/provider/auth/auth_provider.dart';
import 'package:what_to_do/view/auth/auth_page.dart';
import 'package:what_to_do/view/home/home.dart';
import 'package:what_to_do/view/splash/splash.dart';

final _key = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _key,
    debugLogDiagnostics: true,
    initialLocation: HomePage.routeLocation,
    routes: [
      GoRoute(
        path: SplashPage.routeLocation,
        name: SplashPage.routeName,
        builder: (context, state) {
          return const SplashPage();
        },
      ),
      GoRoute(
        path: HomePage.routeLocation,
        name: HomePage.routeName,
        builder: (context, state) {
          return const HomePage();
        },
      ),
      GoRoute(
        path: AuthPage.routeLocation,
        name: AuthPage.routeName,
        builder: (context, state) {
          return const AuthPage();
        },
      ),
    ],
    redirect: (context, state) {
      final isAuth = ref.watch(authProvider).isAuth;
      print('Router is auth: $isAuth');
      final isSplash = state.uri.toString() == SplashPage.routeLocation;
      if (isSplash) {
        return isAuth ? HomePage.routeLocation : AuthPage.routeLocation;
      }
      FlutterNativeSplash.remove();
      final isLoggingIn = state.uri.toString() == AuthPage.routeLocation;
      if (isLoggingIn) return isAuth ? HomePage.routeLocation : null;

      return isAuth ? HomePage.routeLocation : SplashPage.routeLocation;
    },
  );
});
