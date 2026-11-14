import 'package:flutter/material.dart';

class SmartProductCard extends StatelessWidget {
  const SmartProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      // هنا بنستخدم LayoutBuilder عشان نقرر الشكل
      child: LayoutBuilder(
        builder: (context, constraints) {
          // لو المساحة المتاحة أكبر من 400 بكسل، نستخدم الشكل الأفقي
          if (constraints.maxWidth > 400) {
            return _buildHorizontalLayout();
          }
          // غير كده، نستخدم الشكل العمودي
          return _buildVerticalLayout();
        },
      ),
    );
  }

  // 1. الشكل العمودي (الموبايل)
  Widget _buildVerticalLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_buildImage(height: 180), _buildDetails()],
    );
  }

  // 2. الشكل الأفقي (التابلت/الويب)
  Widget _buildHorizontalLayout() {
    return Row(
      children: [
        SizedBox(
          width: 150, // عرض ثابت للصورة في الشكل الأفقي
          height: 150,
          child: _buildImage(height: double.infinity),
        ),
        Expanded(child: _buildDetails()),
      ],
    );
  }

  // الصورة (عشان منكررش الكود)
  Widget _buildImage({required double height}) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepOrange, Colors.white],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Icon(Icons.headphones, size: 60, color: Colors.white),
    );
  }

  // التفاصيل (عشان منكررش الكود)
  Widget _buildDetails() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Wireless Headphones',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'High quality noise-cancelling headphones for daily use.',
            style: TextStyle(color: Colors.grey[600], fontSize: 13),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '\$120.00',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('Add to Cart'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
