import 'package:flutter/material.dart';

class VideoPlayerWidget extends StatelessWidget {
  const VideoPlayerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.indigo.shade800,
        child: Stack(
          children: [
            // Video Thumbnail
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.deepPurple, Colors.white.withOpacity(.1)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),

            // Overlay
            Container(color: Colors.black.withOpacity(.2)),

            // Video Title
            const Positioned(
              top: 20,
              left: 20,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Responsive Design in Flutter',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Learn MediaQuery, LayoutBuilder & OrientationBuilder',
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                ],
              ),
            ),

            // Play Button
            const Center(
              child: CircleAvatar(
                radius: 38,
                backgroundColor: Colors.white24,
                child: Icon(
                  Icons.play_arrow_rounded,
                  size: 50,
                  color: Colors.white,
                ),
              ),
            ),

            // Duration Badge
            Positioned(
              right: 16,
              bottom: 70,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  '12:34',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            // Controls Bar
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: Colors.black.withOpacity(.6)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: const LinearProgressIndicator(
                        value: .3,
                        minHeight: 6,
                        backgroundColor: Colors.white24,
                        valueColor: AlwaysStoppedAnimation(Color(0xffEF4444)),
                      ),
                    ),

                    const SizedBox(height: 12),

                    const Row(
                      children: [
                        Icon(Icons.play_arrow, color: Colors.white),
                        SizedBox(width: 12),
                        Icon(Icons.volume_up, color: Colors.white),
                        Spacer(),
                        Text(
                          '03:42 / 12:34',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(width: 12),
                        Icon(Icons.fullscreen, color: Colors.white),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
