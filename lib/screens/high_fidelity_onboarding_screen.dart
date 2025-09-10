import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class HighFidelityOnboardingScreen extends StatefulWidget {
  const HighFidelityOnboardingScreen({super.key});

  @override
  State<HighFidelityOnboardingScreen> createState() => _HighFidelityOnboardingScreenState();
}

class _HighFidelityOnboardingScreenState extends State<HighFidelityOnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final mediaQueryPadding = MediaQuery.of(context).padding;
    final bottomSafeAreaPadding = mediaQueryPadding.bottom;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/I142_500_417_719.png',
              fit: BoxFit.cover,
            ),
          ),
          // Gradient Overlay
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: screenHeight * (360 / 812), // Height from Figma (360px) relative to screen height (812px)
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFF050505).withOpacity(0.0), // r: 0.0196, g: 0.0196, b: 0.0196, a: 0
                    const Color(0xFF050505).withOpacity(1.0), // r: 0.0196, g: 0.0196, b: 0.0196, a: 1
                  ],
                  stops: const [0.0, 0.2367],
                ),
              ),
            ),
          ),
          // Main Content (Text and Button)
          Positioned(
            // Button's absoluteBoundingBox.y is 702. Screen height 812. 812-702 = 110.
            // But the Home Indicator is present at the very bottom (34px height, at y=778)
            // So, button padding from bottom of safe area: 110 - 34 (estimated safe area padding) = 76px.
            // Let's use 54px + bottomSafeAreaPadding to account for the figma's explicit position and safe area.
            bottom: 54.0 + bottomSafeAreaPadding,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Title Text
                  Text(
                    'Fall in Love with Coffee in Blissful Delight!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.sora(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      letterSpacing: 0.16,
                      height: 1.5, // lineHeightPx: 48, fontSize: 32 -> 48/32 = 1.5
                    ),
                  ),
                  const SizedBox(height: 8), // itemSpacing: 8 in Figma
                  // Subtitle Text
                  Text(
                    'Welcome to our cozy coffee corner, where every cup is a delightful for you.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.sora(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFFA2A2A2), // r: 0.635, g: 0.635, b: 0.635, a: 1
                      letterSpacing: 0.14,
                      height: 1.5, // lineHeightPx: 21, fontSize: 14 -> 21/14 = 1.5
                    ),
                  ),
                  // Space between text and button: 32px (702 - 670)
                  SizedBox(height: screenHeight * (32 / 812)),
                  // Get Started Button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to the home screen (inferred route)
                        context.go('/home_page');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFC67C4E), // r: 0.776, g: 0.486, b: 0.305, a: 1
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        elevation: 0, // Figma doesn't show explicit shadow for the button
                      ),
                      child: Text(
                        'Get Started',
                        style: GoogleFonts.sora(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          height: 1.5, // lineHeightPx: 24, fontSize: 16 -> 24/16 = 1.5
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Status Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              bottom: false, // Don't apply safe area to the bottom for status bar
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '9:41', // From Figma "Time" element
                      style: GoogleFonts.sora(
                        fontSize: 15, // Approximate from Figma "Time" vector bounds
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: const [
                        Icon(Icons.signal_cellular_alt, color: Colors.white, size: 18), // Mobile Signal
                        SizedBox(width: 4),
                        Icon(Icons.wifi, color: Colors.white, size: 18), // Wifi
                        SizedBox(width: 4),
                        Icon(Icons.battery_full, color: Colors.white, size: 18), // Battery
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Home Indicator
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 13.0 + bottomSafeAreaPadding), // 13px from bottom + safe area padding
              child: Container(
                width: 134,
                height: 5,
                decoration: BoxDecoration(
                  color: const Color(0xFF242424), // r: 0.141, g: 0.141, b: 0.141, a: 1
                  borderRadius: BorderRadius.circular(100), // cornerRadius: 100
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
