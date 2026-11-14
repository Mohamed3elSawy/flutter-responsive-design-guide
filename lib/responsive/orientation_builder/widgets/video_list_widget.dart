import 'package:flutter/material.dart';

class VideoListWidget extends StatelessWidget {
  const VideoListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(12),
      itemCount: 6,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: Colors.grey.shade200),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.04),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              // Thumbnail
              Stack(
                children: [
                  Container(
                    width: 110,
                    height: 75,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.deepPurple.shade700, Colors.white],
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.play_circle_fill_rounded,
                        color: Colors.white,
                        size: 34,
                      ),
                    ),
                  ),

                  Positioned(
                    right: 6,
                    bottom: 6,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        "12:34",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(width: 14),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Responsive Design Lesson ${index + 1}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color(0xff1E293B),
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      'Flutter Academy',
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 13,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Row(
                      children: [
                        Icon(
                          Icons.visibility_outlined,
                          size: 14,
                          color: Colors.grey.shade600,
                        ),

                        const SizedBox(width: 4),

                        Text(
                          '1M views',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 12,
                          ),
                        ),

                        const SizedBox(width: 12),

                        Icon(
                          Icons.schedule,
                          size: 14,
                          color: Colors.grey.shade600,
                        ),

                        Text(
                          '2 days ago',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Icon(Icons.more_vert, color: Colors.grey.shade600),
            ],
          ),
        );
      },
    );
  }
}
