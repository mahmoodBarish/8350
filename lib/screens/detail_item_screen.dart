import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

// Helper function to create asset paths
String getAssetPath(String id) {
  // Replace all ':' and ';' characters with '_' for asset path
  return 'assets/images/${id.replaceAll(':', '_').replaceAll(';', '_')}.png';
}

class DetailItemScreen extends StatefulWidget {
  const DetailItemScreen({super.key});

  @override
  State<DetailItemScreen> createState() => _DetailItemScreenState();
}

class _DetailItemScreenState extends State<DetailItemScreen> {
  String _selectedSize = 'M'; // Default selected size, from Figma JSON
  bool _isFavorite = false; // Default favorite state

  // Define colors based on Figma JSON
  static const Color primaryTextColor = Color(0xFF242424); // 0.1411764770746231
  static const Color secondaryTextColor = Color(0xFFA2A2A2); // 0.6352941393852234
  static const Color accentColor = Color(0xFFC67C4E); // 0.7764706015586853
  static const Color selectedSizeBgColor = Color(0xFFF9F2ED); // 0.9764705896377563
  static const Color borderColor = Color(0xFFE3E3E3); // 0.8901960849761963
  static const Color starColor = Color(0xFFFBB621); // 0.9833333492279053, 0.7447109222412109, 0.13111108541488647
  static const Color containerBgOpacityColor = Color(0x59EBEBEB); // 0.35 opacity on #EBEBEB

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Custom Status Bar simulation, if needed, otherwise SafeArea is enough
          SizedBox(height: mediaQuery.padding.top), // Handles status bar height

          // Top Bar (Header: Back Button, Title, Favorite Button)
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.064, // 24/375
              vertical: screenHeight * 0.015, // 12/812
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: Container(
                    width: screenWidth * 0.117, // 44/375
                    height: screenWidth * 0.117, // 44/375
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: borderColor, width: 1),
                    ),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: primaryTextColor,
                      size: screenWidth * 0.05, // Roughly 18-20px
                    ),
                  ),
                ),
                Text(
                  'Detail',
                  style: GoogleFonts.sora(
                    color: primaryTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isFavorite = !_isFavorite;
                    });
                  },
                  child: Container(
                    width: screenWidth * 0.117, // 44/375
                    height: screenWidth * 0.117, // 44/375
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: borderColor, width: 1),
                    ),
                    child: Icon(
                      _isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: _isFavorite ? accentColor : primaryTextColor,
                      size: screenWidth * 0.05, // Roughly 20px
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.012), // 10/812 spacing below header

          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.064), // 24/375
              children: [
                // Product Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    getAssetPath('I154:297;417:715'),
                    width: screenWidth - (screenWidth * 0.064 * 2), // 327/375
                    height: screenHeight * 0.248, // 202/812
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: screenHeight * 0.027), // 22/812 spacing

                // Product Details: Name, Category, Rating, Superiority
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Caffe Mocha',
                              style: GoogleFonts.sora(
                                color: primaryTextColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.005), // 4/812
                            Text(
                              'Ice/Hot',
                              style: GoogleFonts.sora(
                                color: secondaryTextColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.02), // 16/812
                            Row(
                              children: [
                                Icon(Icons.star_rounded, color: starColor, size: 20),
                                SizedBox(width: screenWidth * 0.01), // 4/375
                                Text(
                                  '4.8 ',
                                  style: GoogleFonts.sora(
                                    color: primaryTextColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  '(230)',
                                  style: GoogleFonts.sora(
                                    color: secondaryTextColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            _buildSuperiorityIcon(getAssetPath('I154:291;418:950'), 'Fast Delivery'), // Motorbike icon
                            SizedBox(width: screenWidth * 0.032), // 12/375
                            _buildSuperiorityIcon(getAssetPath('I154:293;418:971'), 'Quality Bean'), // Coffee bean icon
                            SizedBox(width: screenWidth * 0.032), // 12/375
                            _buildSuperiorityIcon(getAssetPath('I154:295;418:967'), 'Extra Milk'), // Milk icon
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.019), // 16/812
                    Divider(color: borderColor, thickness: 1),
                    SizedBox(height: screenHeight * 0.019), // 16/812
                  ],
                ),

                // Description
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Description',
                      style: GoogleFonts.sora(
                        color: primaryTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01), // 8/812
                    Text.rich(
                      TextSpan(
                        text:
                            'A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo.. ',
                        style: GoogleFonts.sora(
                          color: secondaryTextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w300, // Light for description
                          height: 1.5,
                        ),
                        children: [
                          TextSpan(
                            text: 'Read More',
                            style: GoogleFonts.sora(
                              color: accentColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600, // SemiBold for Read More
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.037), // 30/812

                // Size Selection
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Size',
                      style: GoogleFonts.sora(
                        color: primaryTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.019), // 16/812
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildSizeOption('S', screenWidth),
                        _buildSizeOption('M', screenWidth),
                        _buildSizeOption('L', screenWidth),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.15), // Reserve space for the fixed bottom bar
              ],
            ),
          ),
          // Bottom fixed "Price" and "Buy Now" button area
          _buildBottomActionCard(screenWidth, screenHeight, mediaQuery.padding.bottom),
        ],
      ),
    );
  }

  Widget _buildSuperiorityIcon(String assetPath, String tooltipText) {
    return Tooltip(
      message: tooltipText,
      child: Container(
        width: 44, // Fixed size from Figma
        height: 44, // Fixed size from Figma
        decoration: BoxDecoration(
          color: containerBgOpacityColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Image.asset(
            assetPath,
            width: 24, // Fixed size from Figma
            height: 24, // Fixed size from Figma
            color: accentColor, // Apply brand color as overlay, as seen in Figma
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Widget _buildSizeOption(String size, double screenWidth) {
    final isSelected = _selectedSize == size;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedSize = size;
        });
      },
      child: Container(
        width: screenWidth * 0.256, // 96/375
        height: screenWidth * 0.109, // 41/375
        decoration: BoxDecoration(
          color: isSelected ? selectedSizeBgColor : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? accentColor : borderColor,
            width: 1,
          ),
        ),
        child: Center(
          child: Text(
            size,
            style: GoogleFonts.sora(
              color: isSelected ? accentColor : primaryTextColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomActionCard(double screenWidth, double screenHeight, double bottomPadding) {
    return Container(
      width: screenWidth,
      padding: EdgeInsets.only(
        left: screenWidth * 0.064, // 24/375
        right: screenWidth * 0.064, // 24/375
        top: screenHeight * 0.019, // 16/812
        bottom: bottomPadding + screenHeight * 0.02, // Add dynamic padding for home indicator and 16/812
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, -5), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Price',
                style: GoogleFonts.sora(
                  color: secondaryTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: screenHeight * 0.005), // 4/812
              Text(
                '\$ 4.53',
                style: GoogleFonts.sora(
                  color: accentColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              // Example navigation to a hypothetical checkout screen
              context.push('/checkout'); // Infer route as '/checkout'
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: accentColor,
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.107, // 40/375
                vertical: screenHeight * 0.019, // 16/812
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 0,
            ),
            child: Text(
              'Buy Now',
              style: GoogleFonts.sora(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}