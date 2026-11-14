import 'package:flutter/material.dart';

// 1. البوستر
class MoviePoster extends StatelessWidget {
  const MoviePoster({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [Colors.red, Colors.black],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Center(
        child: Icon(Icons.movie_creation, size: 80, color: Colors.white54),
      ),
    );
  }
}

// 2. النصوص والتفاصيل
class MovieInfo extends StatelessWidget {
  const MovieInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Inception (2010)',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 20),
            const SizedBox(width: 4),
            const Text('8.8/10', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(width: 16),
            Text(
              'Sci-Fi, Action',
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text(
          'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.',
          style: TextStyle(height: 1.5),
        ),
        const SizedBox(height: 24),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.play_arrow),
          label: const Text('Watch Trailer'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
