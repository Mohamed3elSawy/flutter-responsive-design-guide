import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'widgets/adaptive_layout.dart';
import 'widgets/movie_details_widgets.dart';

class CustomAdaptiveScreen extends StatelessWidget {
  const CustomAdaptiveScreen({super.key});

  get context => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),

      body: AdaptiveLayout(
        // ================= MOBILE =================
        mobile: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              _buildHeader(
                onBackPressed: () {
                  context.pop();
                },
                icon: Icons.phone_android,
                title: 'Mobile Layout',
                subtitle: 'Poster and details are stacked vertically.',
                color: Colors.green,
              ),

              const SizedBox(height: 20),

              const SizedBox(
                height: 300,
                width: double.infinity,
                child: MoviePoster(),
              ),

              const SizedBox(height: 24),

              const MovieInfo(),
            ],
          ),
        ),

        // ================= TABLET =================
        tablet: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              _buildHeader(
                onBackPressed: () {
                  context.pop();
                },
                icon: Icons.tablet_mac,
                title: 'Tablet Layout',
                subtitle: 'Poster and details are displayed side by side.',
                color: Colors.orange,
              ),

              const SizedBox(height: 24),

              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 300,
                      height: 450,
                      child: MoviePoster(),
                    ),

                    const SizedBox(width: 32),

                    const Expanded(
                      child: SingleChildScrollView(child: MovieInfo()),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // ================= DESKTOP =================
        desktop: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 32),
          child: Column(
            children: [
              _buildHeader(
                onBackPressed: () {
                  context.pop();
                },
                icon: Icons.desktop_windows,
                title: 'Desktop Layout',
                subtitle: 'A wider layout with plenty of horizontal space.',
                color: Colors.blue,
              ),

              const SizedBox(height: 24),

              const SizedBox(
                height: 400,
                width: double.infinity,
                child: MoviePoster(),
              ),

              const SizedBox(height: 32),

              const MovieInfo(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onBackPressed,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color.withOpacity(.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(.3)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.white),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),

                const SizedBox(height: 4),

                Text(subtitle, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: onBackPressed,
            icon: Icon(Icons.arrow_back_ios_new_rounded, color: color),
          ),
        ],
      ),
    );
  }
}
