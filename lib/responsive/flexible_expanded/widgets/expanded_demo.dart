import 'package:flutter/material.dart';

class ExpandedDemo extends StatelessWidget {
  const ExpandedDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Expanded (flex: 2 vs flex: 1)',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color(0xff1E293B),
          ),
        ),

        const SizedBox(height: 6),

        Text(
          'The first widget takes twice the space of the second widget.',
          style: TextStyle(color: Colors.grey.shade600),
        ),

        const SizedBox(height: 16),

        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                height: 90,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xff2563EB), Color(0xff60A5FA)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.space_dashboard, color: Colors.white, size: 28),
                    SizedBox(height: 6),
                    Text(
                      'flex: 2',
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
                  gradient: const LinearGradient(
                    colors: [Colors.green, Colors.white],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.view_agenda, color: Colors.white, size: 28),
                    SizedBox(height: 6),
                    Text(
                      'flex: 1',
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
                  '66%',
                  style: TextStyle(
                    color: Colors.blue.shade700,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  '33%',
                  style: TextStyle(
                    color: Colors.green.shade700,
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
