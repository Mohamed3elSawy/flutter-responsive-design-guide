import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'widgets/video_list_widget.dart';
import 'widgets/video_player_widget.dart';

class OrientationBuilderScreen extends StatelessWidget {
  const OrientationBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),
      body: OrientationBuilder(
        builder: (context, orientation) {
          final isPortrait = orientation == Orientation.portrait;

          if (isPortrait) {
            return Column(
              children: [
                // Header
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.deepPurple, Colors.white],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.stay_current_portrait, color: Colors.white),
                      SizedBox(width: 10),
                      Text(
                        "Portrait Mode",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          context.pop();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const SizedBox(
                    height: 250,
                    child: VideoPlayerWidget(),
                  ),
                ),

                const SizedBox(height: 16),

                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: VideoListWidget(),
                  ),
                ),
              ],
            );
          }

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  flex: 7,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const VideoPlayerWidget(),
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Colors.deepPurple, Colors.white],
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.stay_current_landscape,
                              color: Colors.white,
                            ),
                            SizedBox(width: 8),
                            Text(
                              "Landscape Mode",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {
                                context.pop();
                              },
                              icon: Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 12),

                      const Expanded(child: VideoListWidget()),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
