import 'package:go_router/go_router.dart';
import 'package:responsive_design/pages/home/home_screen.dart';
import 'package:responsive_design/responsive/custom_adaptive/custom_adaptive_screen.dart';
import 'package:responsive_design/responsive/flexible_expanded/flexible_expanded_screen.dart';
import 'package:responsive_design/responsive/layout_builder/layout_builder_screen.dart';
import 'package:responsive_design/responsive/media_query/media_query_screen.dart';
import 'package:responsive_design/responsive/orientation_builder/orientation_builder_screen.dart';
import 'package:responsive_design/responsive/responsive_builder/responsive_builder_screen.dart';
import 'package:responsive_design/responsive/screen_util/screen_util.dart';

import 'app_routes.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.home,
    routes: [
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.mediaQuery,
        builder: (context, state) => const MediaQueryScreen(),
      ),
      GoRoute(
        path: AppRoutes.layoutBuilder,
        builder: (context, state) => const LayoutBuilderScreen(),
      ),
      GoRoute(
        path: AppRoutes.orientationBuilder,
        builder: (context, state) => const OrientationBuilderScreen(),
      ),
      GoRoute(
        path: AppRoutes.flexibleExpanded,
        builder: (context, state) => const FlexibleExpandedScreen(),
      ),
      GoRoute(
        path: AppRoutes.customAdaptive,
        builder: (context, state) => const CustomAdaptiveScreen(),
      ),
      GoRoute(
        path: AppRoutes.responsiveBuilder,
        builder: (context, state) => const ResponsiveBuilderScreen(),
      ),

      GoRoute(
        path: AppRoutes.screenUtil,
        builder: (context, state) => const ScreenUtilExample(),
      ),
    ],
  );
}
