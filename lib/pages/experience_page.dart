import 'package:flutter/material.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F2027),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "JOURNEY",
                style: TextStyle(
                  color: Colors.cyanAccent,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Work Experience",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 30),

              // Timeline List
              _buildTimelineItem(
                company: "Freelance",
                role: "Mobile App Developer",
                period: "2023 - Present",
                description:
                    "Membangun aplikasi mobile menggunakan Flutter untuk berbagai klien lokal dan internasional.",
                isLast: false,
              ),
              _buildTimelineItem(
                company: "Creative Studio",
                role: "UI/UX Designer Intern",
                period: "2022 - 2023",
                description:
                    "Merancang wireframe dan prototipe high-fidelity menggunakan Figma untuk aplikasi e-commerce.",
                isLast: false,
              ),
              _buildTimelineItem(
                company: "Tech Academy",
                role: "Assistant Mentor",
                period: "2021 - 2022",
                description:
                    "Membantu mahasiswa dalam memahami konsep pemrograman Dart dan dasar-dasar Flutter.",
                isLast: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimelineItem({
    required String company,
    required String role,
    required String period,
    required String description,
    required bool isLast,
  }) {
    return IntrinsicHeight(
      child: Row(
        children: [
          // Bagian Garis Timeline
          Column(
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: Colors.cyanAccent,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.cyanAccent.withOpacity(0.5),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              ),
              if (!isLast)
                Expanded(child: Container(width: 2, color: Colors.white10)),
            ],
          ),
          const SizedBox(width: 20),

          // Bagian Konten
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          period,
                          style: const TextStyle(
                            color: Colors.cyanAccent,
                            fontSize: 12,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 12,
                          color: Colors.white24,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      role,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      company,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      description,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
