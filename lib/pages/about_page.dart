import 'package:flutter/material.dart';
import 'dart:ui';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFF0F2027,
      ), // Warna background gelap yang dalam
      body: Stack(
        children: [
          // Background Decor (Lingkaran cahaya abstrak)
          Positioned(
            top: -50,
            right: -50,
            child: CircleAvatar(
              radius: 100,
              backgroundColor: Colors.cyanAccent.withOpacity(0.1),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Section: Avatar & Badges
                  Center(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [Colors.cyanAccent, Colors.blueAccent],
                            ),
                          ),
                          child: const CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.white10,
                            backgroundImage: AssetImage(
                              'assets/profile.webp',
                            ), // Ganti dengan foto kamu
                          ),
                        ),
                        const SizedBox(height: 16),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.cyanAccent.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.cyanAccent.withOpacity(0.5),
                            ),
                          ),
                          child: const Text(
                            'Available for Projects',
                            style: TextStyle(
                              color: Colors.cyanAccent,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Intro Text
                  const Text(
                    "HELO, SAYA",
                    style: TextStyle(
                      color: Colors.cyanAccent,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Jodi Jonatan",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      height: 1.1,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Content Card
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: Colors.white.withOpacity(0.1)),
                    ),
                    child: const Text(
                      'Seorang Software Developer yang berdedikasi untuk menciptakan pengalaman pengguna yang mulus melalui UI yang modern, bersih, dan performa yang optimal.',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        height: 1.6,
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Stats Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildStatItem("2+", "Years Experience"),
                      _buildStatItem("60+", "Projects"),
                      _buildStatItem("10+", "Clients"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.white54, fontSize: 14),
        ),
      ],
    );
  }
}
