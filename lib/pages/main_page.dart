import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Untuk HapticFeedback
import 'dart:ui';

// Import halaman-halaman portofolio kamu
import 'about_page.dart';
import 'skills_page.dart';
import 'experience_page.dart';
import 'certificate_page.dart';
import 'contact_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _index = 0;

  // Daftar halaman (Tanpa HomePage)
  final List<Widget> pages = const [
    AboutPage(), // Index 0
    SkillsPage(), // Index 1
    ExperiencePage(), // Index 2
    CertificatePage(), // Index 3
    ContactPage(), // Index 4
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F2027),
      // extendBody: true sangat penting agar konten halaman terlihat di balik navbar yang transparan
      extendBody: true,

      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        // Menambahkan efek Fade dan Slide saat pindah halaman
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 0.02),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
          );
        },
        // Memberikan Key unik agar AnimatedSwitcher tahu kapan harus beranimasi
        child: Container(key: ValueKey<int>(_index), child: pages[_index]),
      ),

      bottomNavigationBar: SafeArea(
        child: Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          height: 70,
          decoration: BoxDecoration(
            color: const Color(0xFF0F2027).withOpacity(0.8),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.white.withOpacity(0.1), width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Ikon disesuaikan dengan urutan pages:
                    _buildNavItem(Icons.person_rounded, 0), // About
                    _buildNavItem(Icons.code_rounded, 1), // Skills
                    _buildNavItem(Icons.work_rounded, 2), // Experience
                    _buildNavItem(Icons.card_membership_rounded, 3), // Cert
                    _buildNavItem(Icons.contact_mail_rounded, 4), // Contact
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    bool isSelected = _index == index;
    return GestureDetector(
      onTap: () {
        if (_index != index) {
          // Menambahkan getaran halus saat tombol ditekan
          HapticFeedback.lightImpact();
          setState(() => _index = index);
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          // Background icon yang menyala saat terpilih
          color: isSelected
              ? Colors.cyanAccent.withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.cyanAccent : Colors.white54,
              size: isSelected ? 26 : 24,
            ),
            // Penanda titik di bawah ikon yang aktif
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.only(top: 4),
              height: 4,
              width: isSelected ? 4 : 0,
              decoration: BoxDecoration(
                color: Colors.cyanAccent,
                shape: BoxShape.circle,
                boxShadow: [
                  if (isSelected)
                    BoxShadow(
                      color: Colors.cyanAccent.withOpacity(0.5),
                      blurRadius: 5,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
