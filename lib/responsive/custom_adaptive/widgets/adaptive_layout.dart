import 'package:flutter/material.dart';

class AdaptiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const AdaptiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  // بنحدد المقاسات مرة واحدة هنا وبنستخدمها في كل المشروع
  static const double tabletBreakpoint = 600;
  static const double desktopBreakpoint = 900;

  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < tabletBreakpoint;
      
  static bool isTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= tabletBreakpoint &&
      MediaQuery.sizeOf(context).width < desktopBreakpoint;
      
  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= desktopBreakpoint;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    if (width >= desktopBreakpoint && desktop != null) {
      return desktop!;
    } else if (width >= tabletBreakpoint && tablet != null) {
      return tablet!;
    }
    return mobile;
  }
}