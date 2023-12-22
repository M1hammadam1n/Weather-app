import 'package:flutter_application_1/ui/pages/home_page.dart';
import 'package:flutter_application_1/ui/pages/search_page.dart';
import 'package:flutter_application_1/ui/routes/app_routes.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter router = GoRouter(routes: [
    GoRoute(
      path: AppRoutes.home,
      builder: (context, stats) => const Homepage(),
    ),
    GoRoute(
      path: AppRoutes.search,
      builder: (context, stats) => const searchPage(),
    ),
  ]);
}
