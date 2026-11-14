import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenUtilExample extends StatelessWidget {
  const ScreenUtilExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(24.w),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.brown, Color(0xffA1887F)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24.r),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Flutter ScreenUtil',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 8.h),

                          Text(
                            'Scale dimensions, spacing, radius and typography across different screen sizes.',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(12.r),
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
              ),

              SizedBox(height: 20.h),

              // Info Card
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(18.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(color: Colors.brown.shade100),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Scaled Values',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 12.h),

                    Text(
                      '• 16.w → Responsive Width',
                      style: TextStyle(fontSize: 14.sp),
                    ),

                    SizedBox(height: 6.h),

                    Text(
                      '• 16.h → Responsive Height',
                      style: TextStyle(fontSize: 14.sp),
                    ),

                    SizedBox(height: 6.h),

                    Text(
                      '• 16.r → Responsive Radius',
                      style: TextStyle(fontSize: 14.sp),
                    ),

                    SizedBox(height: 6.h),

                    Text(
                      '• 16.sp → Responsive Font Size',
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.h),

              Text(
                'Responsive Cards',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff1E293B),
                ),
              ),

              SizedBox(height: 12.h),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.w,
                  mainAxisSpacing: 12.h,
                  childAspectRatio: 1.1,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.brown.shade300, Colors.brown.shade600],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(18.r),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.phone_android,
                          color: Colors.white,
                          size: 36.sp,
                        ),

                        SizedBox(height: 10.h),

                        Text(
                          'Item ${index + 1}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 4.h),

                        Text(
                          'Scaled UI',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
