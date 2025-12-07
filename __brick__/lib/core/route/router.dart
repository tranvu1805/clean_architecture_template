import 'package:{{project_name}}/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
              GoRoute(
                path: Routes.home,
                builder: (context, state) => const HomePage(),
                routes: [],
              )
            ],
          ),
        ],
      ),
    ],
  );
}