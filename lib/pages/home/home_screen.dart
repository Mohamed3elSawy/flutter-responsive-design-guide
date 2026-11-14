import 'package:flutter/material.dart';
import 'package:responsive_design/pages/home/skill_card.dart';
import 'package:responsive_design/pages/home/skills_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(24, 30, 24, 24),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.teal, Colors.white],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Responsive Design",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Learn adaptive layouts and responsive UI in Flutter 🚀",
                    style: TextStyle(color: Colors.white70, fontSize: 15),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: skillsData.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final skill = skillsData[index];

                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    child: SkillCard(
                      title: skill.title,
                      subtitle: skill.subtitle,
                      icon: skill.icon,
                      iconColor: skill.color,
                      route: skill.route,
                      borderColor: skill.borderColor,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
