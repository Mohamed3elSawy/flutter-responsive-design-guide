import 'package:flutter/material.dart';
import 'package:responsive_design/pages/home/skill_model.dart';

import '../../core/routing/app_routes.dart';

const List<SkillModel> skillsData = [
  SkillModel(
    title: '1. MediaQuery Basics',
    subtitle: 'Screen width, height, and pixel ratio',
    icon: Icons.aspect_ratio,
    color: Colors.blue,
    route: AppRoutes.mediaQuery,
    borderColor: Colors.blue,
  ),
  SkillModel(
    title: '2. LayoutBuilder',
    subtitle: 'Build based on available space',
    icon: Icons.dashboard_customize_outlined,
    color: Colors.deepOrange,
    route: AppRoutes.layoutBuilder,
    borderColor: Colors.deepOrange,
  ),
  SkillModel(
    title: '3. OrientationBuilder',
    subtitle: 'Handle portrait and landscape modes',
    icon: Icons.screen_rotation,
    color: Colors.purple,
    route: AppRoutes.orientationBuilder,
    borderColor: Colors.purple,
  ),
  SkillModel(
    title: '4. Flexible & Expanded',
    subtitle: 'Distribute space intelligently',
    icon: Icons.view_column_outlined,
    color: Colors.green,
    route: AppRoutes.flexibleExpanded,
    borderColor: Colors.green,
  ),
  SkillModel(
    title: '5. Custom Adaptive Widget',
    subtitle: 'Build your own responsive wrapper',
    icon: Icons.devices_other,
    color: Colors.red,
    route: AppRoutes.customAdaptive,
    borderColor: Colors.red,
  ),
  SkillModel(
    title: '6. responsive_builder',
    subtitle: 'Using the popular package',
    icon: Icons.extension,
    color: Colors.teal,
    route: AppRoutes.responsiveBuilder,
    borderColor: Colors.teal,
  ),

  SkillModel(
    title: '7. screen_util',
    subtitle: 'Using the popular package',
    icon: Icons.extension,
    color: Colors.brown,
    route: AppRoutes.screenUtil,
    borderColor: Colors.brown,
  ),
];
