import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'widgets/adaptive_grid.dart';
import 'widgets/screen_info_card.dart';

class MediaQueryScreen extends StatelessWidget {
  const MediaQueryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width = size.width;

    final crossAxisCount = width > 900
        ? 4
        : width > 600
        ? 3
        : 2;

    final deviceType = width > 900
        ? "🖥 Desktop View"
        : width > 600
        ? "📱 Tablet View"
        : "📲 Mobile View";

    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.blue, Colors.white],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(.25),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "MediaQuery",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 8),

                      const Text(
                        "Adaptive layout based on screen size",
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),

                      const SizedBox(height: 16),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          deviceType,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Screen Info
            ScreenInfoCard(
              width: width,
              height: size.height,
              crossAxisCount: crossAxisCount,
            ),

            const SizedBox(height: 20),

            const Text(
              "Responsive Grid",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xff1E293B),
              ),
            ),

            const SizedBox(height: 6),

            Text(
              "The grid adjusts automatically according to screen width.",
              style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
            ),

            const SizedBox(height: 16),

            Expanded(
              child: AdaptiveGrid(
                key: ValueKey(crossAxisCount),
                crossAxisCount: crossAxisCount,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
