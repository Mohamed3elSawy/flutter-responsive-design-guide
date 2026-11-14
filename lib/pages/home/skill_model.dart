import 'package:flutter/material.dart';

class SkillModel {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final String route;
  final Color borderColor;

  const SkillModel({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.route,
    required this.borderColor,
  });
}