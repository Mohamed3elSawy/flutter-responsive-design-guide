import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ResponsiveBuilderScreen extends StatelessWidget {
  const ResponsiveBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ScreenTypeLayout.builder(
        mobile: (_) => _buildMobile(context),
        tablet: (_) => _buildTablet(context),
        desktop: (_) => _buildDesktop(context),
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [color, color.withOpacity(.7)]),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(subtitle, style: const TextStyle(color: Colors.white70)),
              ],
            ),
          ),

          Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobile(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          _buildHeader(
            context,
            title: 'Mobile Layout',
            subtitle: 'Single column, stacked content',
            icon: Icons.phone_android,
            color: Colors.blue,
          ),

          const Spacer(),

          Icon(Icons.phone_android, size: 80, color: Colors.blue.shade400),

          const SizedBox(height: 16),

          const Text(
            '📱 Mobile Layout',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          const Text('Single column, stacked content'),

          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildTablet(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          _buildHeader(
            context,
            title: 'Tablet Layout',
            subtitle: 'Two columns, more space',
            icon: Icons.tablet_mac,
            color: Colors.green,
          ),

          const Spacer(),

          Icon(Icons.tablet_mac, size: 80, color: Colors.green.shade400),

          const SizedBox(height: 16),

          const Text(
            '📱 Tablet Layout',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          const Text('Two columns, more space'),

          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildDesktop(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          _buildHeader(
            context,
            title: 'Desktop Layout',
            subtitle: 'Full navigation + multi-column',
            icon: Icons.desktop_windows,
            color: Colors.purple,
          ),

          const Spacer(),

          Icon(Icons.desktop_mac, size: 80, color: Colors.purple.shade400),

          const SizedBox(height: 16),

          const Text(
            '🖥 Desktop Layout',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          const Text('Full navigation + multi-column'),

          const Spacer(),
        ],
      ),
    );
  }
}
