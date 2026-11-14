import 'package:flutter/material.dart';

class ScreenInfoCard extends StatelessWidget {
  final double width;
  final double height;
  final int crossAxisCount;

  const ScreenInfoCard({
    super.key,
    required this.width,
    required this.height,
    required this.crossAxisCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.blue.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.analytics_outlined, color: Colors.blue.shade600),
              const SizedBox(width: 8),
              const Text(
                "Screen Information",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),

          const SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: _InfoItem(
                  title: "Width",
                  value: "${width.toStringAsFixed(0)} px",
                  icon: Icons.width_full,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _InfoItem(
                  title: "Height",
                  value: "${height.toStringAsFixed(0)} px",
                  icon: Icons.height,
                  color: Colors.green,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _InfoItem(
                  title: "Columns",
                  value: "$crossAxisCount",
                  icon: Icons.grid_view_rounded,
                  color: Colors.blueGrey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _InfoItem({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color.withOpacity(.08),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 26),

          const SizedBox(height: 8),

          Text(
            value,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),

          const SizedBox(height: 4),

          Text(title, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }
}
