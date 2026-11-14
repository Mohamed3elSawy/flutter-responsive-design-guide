import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/routing/app_router.dart';

void main() {
  runApp(const ResponsiveApp());
}

class ResponsiveApp extends StatelessWidget {
  const ResponsiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Responsive Demo',
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}