import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'widgets/smart_product_card.dart';

class LayoutBuilderScreen extends StatelessWidget {
  const LayoutBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.deepOrange, Colors.white],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.orange.withOpacity(.20),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LayoutBuilder',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Build responsive widgets based on available space.',
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Full Width Card',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xff1E293B),
              ),
            ),

            const SizedBox(height: 6),

            Text(
              'This card receives the available width and adapts its layout automatically.',
              style: TextStyle(color: Colors.grey.shade600),
            ),

            const SizedBox(height: 16),

            const SmartProductCard(),

            const SizedBox(height: 32),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.indigo.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'Same Widget • Different Constraints',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),

            const SizedBox(height: 16),

            const Text(
              'When the available width becomes smaller, the widget rebuilds itself using LayoutBuilder.',
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 16),

            Center(
              child: Container(
                width: 300,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.shade200),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.04),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const SmartProductCard(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
