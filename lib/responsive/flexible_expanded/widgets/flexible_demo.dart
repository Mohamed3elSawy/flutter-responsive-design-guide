import 'package:flutter/material.dart';

class FlexibleDemo extends StatelessWidget {
  const FlexibleDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Flexible (loose fit)',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color(0xff1E293B),
          ),
        ),

        const SizedBox(height: 6),

        Text(
          'Flexible can use less space if its child does not need all available width.',
          style: TextStyle(color: Colors.grey.shade600),
        ),

        const SizedBox(height: 16),

        Row(
          children: [
            Flexible(
              flex: 2,
              child: Container(
                height: 90,
                width: 100,
                decoration: BoxDecoration(
                  color: const Color(0xff10B981),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.fit_screen, color: Colors.white, size: 28),
                    SizedBox(height: 6),
                    Text(
                      'Flexible',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              flex: 1,
              child: Container(
                height: 90,
                decoration: BoxDecoration(
                  color: const Color(0xffEF4444),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.open_in_full, color: Colors.white, size: 28),
                    SizedBox(height: 6),
                    Text(
                      'Expanded',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        Row(
          children: [
            Expanded(
              flex: 2,
              child: Center(
                child: Text(
                  'Loose Fit',
                  style: TextStyle(
                    color: Colors.green.shade700,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  'Tight Fit',
                  style: TextStyle(
                    color: Colors.red.shade700,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
