import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

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
                "CONNECT",
                style: TextStyle(
                  color: Colors.cyanAccent,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Get In Touch",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "Punya ide menarik? Mari berkolaborasi dan bangun sesuatu yang luar biasa bersama.",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 40),

              _buildModernContactCard(
                icon: Icons.alternate_email_rounded,
                title: "Email",
                value: "jo@email.com",
                color: Colors.orangeAccent,
              ),
              const SizedBox(height: 16),
              _buildModernContactCard(
                icon: Icons.chat_bubble_outline_rounded,
                title: "WhatsApp",
                value: "+62 812 3456 789",
                color: Colors.greenAccent,
              ),
              const SizedBox(height: 16),
              _buildModernContactCard(
                icon: Icons.link_rounded,
                title: "LinkedIn",
                value: "linkedin.com/in/jodev",
                color: Colors.blueAccent,
              ),

              const SizedBox(height: 50),

              const Center(
                child: Text(
                  "Follow me on social media",
                  style: TextStyle(color: Colors.white38, fontSize: 13),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialIcon(Icons.camera_alt_outlined),
                  _buildSocialIcon(Icons.terminal_rounded),
                  _buildSocialIcon(Icons.language_rounded),
                ],
              ),

              const SizedBox(height: 40),
              Center(
                child: Text(
                  "Based in Jakarta, Indonesia 🇮🇩",
                  style: TextStyle(color: Colors.white.withOpacity(0.5)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildModernContactCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.open_in_new_rounded,
            color: Colors.white.withOpacity(0.2),
            size: 18,
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white10),
        color: Colors.white.withOpacity(0.02),
      ),
      child: Icon(icon, color: Colors.white70, size: 24),
    );
  }
}
