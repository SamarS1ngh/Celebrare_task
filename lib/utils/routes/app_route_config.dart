import 'package:editing_software/utils/routes/app_route_names.dart';
import 'package:editing_software/utils/routes/navigator_key.dart';
import 'package:editing_software/view/screens/splash_screen/main_screen/main_screen.dart';
import 'package:go_router/go_router.dart';

class GoRouterConfig {
  static GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
        name: AppRouteNames.splashScreenRoute,
        path: '/',
        builder: (context, state) {
          return const MainEditorScreen();
        },
      ),
    ],
  );
}
