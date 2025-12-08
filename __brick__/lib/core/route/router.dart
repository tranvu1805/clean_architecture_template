import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'app_shell.dart';
import 'routes.dart';


final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);

GoRouter router() {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: Routes.signIn,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, shellRoutes) => MultiBlocProvider(
          providers: [
          ],
          child: AppPage(navigationShell: shellRoutes),
        ),
        branches: [
          StatefulShellBranch(
            routes: [
            ],
          ),
        ],
      ),
    ],
  );
}