import 'dart:async';
import 'package:dormly/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app/app_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Get.offAllNamed('/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,

        decoration: BoxDecoration(
          gradient: isDark? AppTheme.darkBgGradient:AppTheme.lightBgGradient,
        ),
        child: SafeArea(
          child: Column(
            children: [
              const Spacer(),
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: AppTheme.primaryGradient,
                ),
                child: const Icon(
                  Icons.home_outlined,
                  size: 42,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 25),
              Text(
                "Dormly",
                style: theme.textTheme.bodyLarge,
              ),

              const SizedBox(height: 10),
              Text(
                "Find a place that feels right.",
                style: GoogleFonts.dmSans(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: AppColors.secTxt
                ),
              ),

              const Spacer(),

              Text(
                "Verified owners · Visit first · Real reviews",
                style: GoogleFonts.dmSans(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w400,
                  color: isDark ? const Color(0xFF475569) : const Color(0xFF94A3B8),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}