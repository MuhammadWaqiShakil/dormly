import 'package:dormly/app/app_theme.dart';
import 'package:dormly/constant/app_route.dart';
import 'package:dormly/controller/auth_controller.dart';
import 'package:dormly/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final ThemeController themeController = Get.put(ThemeController());

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  InputDecoration _fieldDecoration(BuildContext context, String hint, {Widget? suffixIcon}) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        color: isDark ? const Color(0xFF1E283F) : const Color(0xFFE2E8F0),
      ),
    );

    return InputDecoration(
      hintText: hint,
      hintStyle: GoogleFonts.dmSans(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: isDark ? const Color(0xFF64748B) : const Color(0xFF94A3B8),
      ),
      filled: true,
      fillColor: theme.colorScheme.surface,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      border: border,
      enabledBorder: border,
      focusedBorder: border.copyWith(
        borderSide: BorderSide(color: theme.colorScheme.primary, width: 1.5),
      ),
      suffixIcon: suffixIcon,
    );
  }

  Widget _label(BuildContext context, String text) {
    final theme = Theme.of(context);
    return Text(
      text,
      style: theme.textTheme.labelLarge ??
          GoogleFonts.dmSans(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: theme.textTheme.bodyLarge?.color,
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 1. Get current theme and brightness
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: isDark ? AppTheme.darkBgGradient : AppTheme.lightBgGradient,
        ),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              gradient: AppTheme.primaryGradient, // Gradient from AppTheme
                            ),
                            child: const Icon(
                              Icons.home_outlined,
                              color: Colors.white,
                              size: 32,
                            ),
                          ),
                          Obx(() {
                            return Switch(
                              value: themeController.isDarkMode.value,
                              hoverColor: Colors.white,
                              onChanged: (value) {
                                themeController.toggleTheme();
                              },
                            );
                          }),
                        ],
                      ),


                      const SizedBox(height: 24),


                      Text(
                        "Create Account",
                        style: theme.textTheme.headlineLarge,
                      ),

                      const SizedBox(height: 8),

                      Text(
                        "Log in to find or manage hostels.",
                        style: theme.textTheme.bodyLarge,
                      ),

                      const SizedBox(height: 28),

                      // --- Email Field ---
                      _label(context, "Email"),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        style: GoogleFonts.dmSans(
                          color: theme.colorScheme.onSurface,
                          fontSize: 15,
                        ),
                        cursorColor: theme.colorScheme.primary,
                        decoration: _fieldDecoration(context, "ali@email.com"),
                      ),

                      const SizedBox(height: 18),

                      // --- Password Field ---
                      _label(context, "Password"),
                      const SizedBox(height: 8),
                      Obx(() {
                        return TextField(
                          controller: _passwordController,
                          obscureText: AuthController.obscurePassword.value,
                          style: GoogleFonts.dmSans(
                            color: theme.colorScheme.onSurface,
                            fontSize: 15,
                          ),
                          cursorColor: theme.colorScheme.primary,
                          decoration: _fieldDecoration(
                            context,
                            "••••••••",
                            suffixIcon: IconButton(
                              onPressed: AuthController.changeObscure,
                              icon: Icon(
                                AuthController.obscurePassword.value
                                    ? Icons.visibility_off_outlined
                                    : Icons.remove_red_eye_outlined,
                                color: isDark
                                    ? const Color(0xFF64748B)
                                    : const Color(0xFF94A3B8),
                                size: 20,
                              ),
                            ),
                          ),
                        );
                      }),

                      const SizedBox(height: 12),


                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                          },
                          child: Text(
                            "Forgot password?",
                            style: GoogleFonts.dmSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: isDark
                                  ? const Color(0xFF8190B7)
                                  : theme.colorScheme.primary,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      Container(
                        width: double.infinity,
                        height: 52,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: AppTheme.primaryGradient,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_emailController.text.isEmpty ||
                                _passwordController.text.isEmpty) {
                              Get.snackbar(
                                "Error",
                                "Email and Password are required",
                                colorText: Colors.red,
                                snackPosition: SnackPosition.TOP,
                              );
                            } else {
                              print("Logged In");
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Obx(() {
                            if (AuthController.isLoading.value) {
                              return const SizedBox(
                                width: 22,
                                height: 22,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.5,
                                  color: Color(0xFF0C1327),
                                ),
                              );
                            }
                            return Text(
                              "Continue",
                              style: GoogleFonts.dmSans(
                                color: isDark? Color(0xFF0C1327): Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            );
                          }),
                        ),
                      ),

                      const SizedBox(height: 14),

                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: () {
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,

                            backgroundColor: isDark
                                ? const Color(0xFF19203A)
                                : const Color(0xFFF1F5F9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                              side: BorderSide(
                                color: isDark
                                    ? const Color(0xFF252F4B)
                                    : const Color(0xFFE2E8F0),
                              ),
                            ),
                          ),
                          child: Text(
                            "Continue with Google",
                            style: GoogleFonts.dmSans(
                              color: theme.colorScheme.onSurface,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),

                      const Spacer(),

                      Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "New here? ",
                              style: GoogleFonts.dmSans(
                                fontSize: 14,
                                color: theme.textTheme.bodyLarge?.color,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(AppRoute.signupRoute);
                              },
                              child: Text(
                                "Create account",
                                style: GoogleFonts.dmSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: theme.colorScheme.onSurface,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}