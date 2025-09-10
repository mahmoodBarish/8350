import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  String _selectedDeliveryType = 'Deliver'; // State for Deliver/Pickup
  int _quantity = 1; // State for product quantity

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Responsive padding based on a 375px wide screen
    final horizontalPadding = screenWidth * (24 / 375);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * (20 / 812)), // Top padding
                  _buildAppBar(context, screenWidth),
                  SizedBox(height: screenHeight * (24 / 812)), // Spacing 1.5 * 16
                  _buildDeliveryTypeSelection(screenWidth),
                  SizedBox(height: screenHeight * (24 / 812)),
                  _buildDeliveryAddress(screenWidth),
                  SizedBox(height: screenHeight * (40 / 812)), // Space before divider
                  const Divider(height: 4, thickness: 4, color: Color(0xFFF7F4F2)),
                  SizedBox(height: screenHeight * (40 / 812)),
                  _buildCheckoutProduct(screenWidth),
                  SizedBox(height: screenHeight * (32 / 812)),
                  _buildDiscountSection(screenWidth),
                  SizedBox(height: screenHeight * (32 / 812)),
                  _buildPaymentSummary(screenWidth),
                  SizedBox(height: screenHeight * (165 / 812)), // Space for bottom persistent section
                ],
              ),
            ),
            _buildPersistentBottomSection(screenWidth, screenHeight),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            context.pop(); // Navigate back
          },
          child: Container(
            padding: const EdgeInsets.all(10), // Figma 24x24 with 10 padding
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: const Color(0xFF2A2A2A), // From text 154:245 fill color
              size: screenWidth * (24 / 375),
            ),
          ),
        ),
        Text(
          'Order',
          style: GoogleFonts.sora(
            fontSize: screenWidth * (16 / 375),
            fontWeight: FontWeight.w600,
            color: const Color(0xFF242424), // From 154:245
          ),
        ),
        SizedBox(width: screenWidth * (24 / 375)), // Placeholder for potential right element
      ],
    );
  }

  Widget _buildDeliveryTypeSelection(double screenWidth) {
    return Container(
      width: screenWidth, // As per Figma layout
      padding: EdgeInsets.all(screenWidth * (4 / 375)),
      decoration: BoxDecoration(
        color: const Color(0xFFEDEEF0), // Figma ID 154:123
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedDeliveryType = 'Deliver';
                });
              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: screenWidth * (8 / 375)),
                decoration: BoxDecoration(
                  color: _selectedDeliveryType == 'Deliver'
                      ? const Color(0xFFC67C4E) // Figma ID 142:107
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Deliver',
                  style: GoogleFonts.sora(
                    fontSize: screenWidth * (16 / 375),
                    fontWeight: FontWeight.w600,
                    color: _selectedDeliveryType == 'Deliver'
                        ? Colors.white
                        : const Color(0xFF242424), // Figma ID 142:5
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedDeliveryType = 'Pickup';
                });
              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: screenWidth * (8 / 375)),
                decoration: BoxDecoration(
                  color: _selectedDeliveryType == 'Pickup'
                      ? const Color(0xFFC67C4E)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Pick Up',
                  style: GoogleFonts.sora(
                    fontSize: screenWidth * (16 / 375),
                    fontWeight: FontWeight.w400, // Regular for unselected
                    color: _selectedDeliveryType == 'Pickup'
                        ? Colors.white
                        : const Color(0xFF242424),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeliveryAddress(double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Delivery Address',
          style: GoogleFonts.sora(
            fontSize: screenWidth * (16 / 375),
            fontWeight: FontWeight.w600,
            color: const Color(0xFF242424),
          ),
        ),
        SizedBox(height: screenWidth * (16 / 375)),
        Text(
          'Jl. Kpg Sutoyo',
          style: GoogleFonts.sora(
            fontSize: screenWidth * (14 / 375),
            fontWeight: FontWeight.w600,
            color: const Color(0xFF303030), // Figma ID 154:122
          ),
        ),
        SizedBox(height: screenWidth * (4 / 375)),
        Text(
          'Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.',
          style: GoogleFonts.sora(
            fontSize: screenWidth * (12 / 375),
            fontWeight: FontWeight.w400,
            color: const Color(0xFF808080), // Figma ID 142:6
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: screenWidth * (16 / 375)),
        Row(
          children: [
            _buildAddressOptionButton(
              context,
              icon: Icons.edit_outlined,
              text: 'Edit Address',
              onTap: () {
                // Handle edit address
              },
              screenWidth: screenWidth,
            ),
            SizedBox(width: screenWidth * (8 / 375)),
            _buildAddressOptionButton(
              context,
              icon: Icons.note_add_outlined,
              text: 'Add Note',
              onTap: () {
                // Handle add note
              },
              screenWidth: screenWidth,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAddressOptionButton(BuildContext context, {required IconData icon, required String text, required VoidCallback onTap, required double screenWidth}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * (12 / 375), vertical: screenWidth * (6 / 375)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFF808080), width: 1), // Figma ID 142:6
          color: Colors.white, // Figma ID 142:3
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: screenWidth * (14 / 375),
              color: const Color(0xFF303030), // Figma ID 154:122
            ),
            SizedBox(width: screenWidth * (4 / 375)),
            Text(
              text,
              style: GoogleFonts.sora(
                fontSize: screenWidth * (12 / 375),
                fontWeight: FontWeight.w400,
                color: const Color(0xFF303030), // Figma ID 154:122
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckoutProduct(double screenWidth) {
    // Image asset path from Figma ID: "I154:206;417:715"
    String imagePath = _getImageAssetPath("I154:206;417:715");

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                width: screenWidth * (54 / 375),
                height: screenWidth * (54 / 375),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: screenWidth * (16 / 375)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Caffe Mocha',
                  style: GoogleFonts.sora(
                    fontSize: screenWidth * (16 / 375),
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF242424),
                  ),
                ),
                SizedBox(height: screenWidth * (4 / 375)),
                Text(
                  'Deep Foam',
                  style: GoogleFonts.sora(
                    fontSize: screenWidth * (12 / 375),
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF808080),
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  if (_quantity > 1) _quantity--;
                });
              },
              child: Container(
                padding: EdgeInsets.all(screenWidth * (4 / 375)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFFEDEEF0)), // Figma ID 154:124
                ),
                child: Icon(
                  Icons.remove_circle_outline_rounded,
                  size: screenWidth * (16 / 375), // Actual icon size 16 in Figma for minuscircle group
                  color: const Color(0xFF808080), // Figma ID 142:6
                ),
              ),
            ),
            SizedBox(width: screenWidth * (18 / 375)),
            Text(
              '$_quantity',
              style: GoogleFonts.sora(
                fontSize: screenWidth * (14 / 375),
                fontWeight: FontWeight.w600,
                color: const Color(0xFF2A2A2A), // Figma ID 154:121
              ),
            ),
            SizedBox(width: screenWidth * (18 / 375)),
            GestureDetector(
              onTap: () {
                setState(() {
                  _quantity++;
                });
              },
              child: Container(
                padding: EdgeInsets.all(screenWidth * (4 / 375)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFFEDEEF0)), // Figma ID 154:124
                ),
                child: Icon(
                  Icons.add_circle_outline_rounded,
                  size: screenWidth * (16 / 375), // Actual icon size 16 in Figma for pluscircle group
                  color: const Color(0xFF2A2A2A), // Figma ID 154:121
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDiscountSection(double screenWidth) {
    return Container(
      width: screenWidth,
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * (16 / 375),
        vertical: screenWidth * (16 / 375),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEDEEF0)), // Figma ID 154:123
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.local_offer_outlined, // Interpreted from 'Discount'
                size: screenWidth * (20 / 375),
                color: const Color(0xFFC67C4E), // Figma ID 142:107
              ),
              SizedBox(width: screenWidth * (16 / 375)),
              Text(
                '1 Discount is Applies',
                style: GoogleFonts.sora(
                  fontSize: screenWidth * (14 / 375),
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF303030), // Figma ID 154:122
                ),
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios_rounded, // Interpreted from 'Arrow - Right 2'
            size: screenWidth * (20 / 375),
            color: const Color(0xFF2A2A2A), // Figma ID 154:121
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentSummary(double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment Summary',
          style: GoogleFonts.sora(
            fontSize: screenWidth * (16 / 375),
            fontWeight: FontWeight.w600,
            color: const Color(0xFF242424),
          ),
        ),
        SizedBox(height: screenWidth * (16 / 375)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Price',
              style: GoogleFonts.sora(
                fontSize: screenWidth * (14 / 375),
                fontWeight: FontWeight.w400,
                color: const Color(0xFF303030),
              ),
            ),
            Text(
              '\$ 4.53',
              style: GoogleFonts.sora(
                fontSize: screenWidth * (14 / 375),
                fontWeight: FontWeight.w600,
                color: const Color(0xFF242424),
              ),
            ),
          ],
        ),
        SizedBox(height: screenWidth * (8 / 375)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Delivery Fee',
              style: GoogleFonts.sora(
                fontSize: screenWidth * (14 / 375),
                fontWeight: FontWeight.w400,
                color: const Color(0xFF303030),
              ),
            ),
            Row(
              children: [
                Text(
                  '\$ 2.0',
                  style: GoogleFonts.sora(
                    fontSize: screenWidth * (14 / 375),
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF2A2A2A), // Figma ID 154:121
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                SizedBox(width: screenWidth * (8 / 375)),
                Text(
                  '\$ 1.0',
                  style: GoogleFonts.sora(
                    fontSize: screenWidth * (14 / 375),
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF242424),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPersistentBottomSection(double screenWidth, double screenHeight) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: screenWidth,
        padding: EdgeInsets.only(
          left: screenWidth * (24 / 375),
          right: screenWidth * (24 / 375),
          top: screenHeight * (16 / 812),
          bottom: screenHeight * (46 / 812),
        ),
        decoration: const BoxDecoration(
          color: Colors.white, // Figma ID 142:3
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.account_balance_wallet_outlined, // Interpreted from 'Wallet'
                      size: screenWidth * (20 / 375),
                      color: const Color(0xFFC67C4E), // Figma ID 142:107
                    ),
                    SizedBox(width: screenWidth * (16 / 375)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cash/Wallet',
                          style: GoogleFonts.sora(
                            fontSize: screenWidth * (14 / 375),
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF242424),
                          ),
                        ),
                        SizedBox(height: screenWidth * (4 / 375)),
                        Text(
                          '\$ 5.53',
                          style: GoogleFonts.sora(
                            fontSize: screenWidth * (12 / 375),
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFC67C4E),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Icon(
                  Icons.keyboard_arrow_down_rounded, // Interpreted from 'Arrow - Down 2'
                  size: screenWidth * (24 / 375),
                  color: const Color(0xFF2A2A2A), // Figma ID 154:121
                ),
              ],
            ),
            SizedBox(height: screenHeight * (8 / 812)),
            _buildOrderButton(context, screenWidth),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderButton(BuildContext context, double screenWidth) {
    return ElevatedButton(
      onPressed: () {
        // Navigate to order confirmation or home screen
        // Example: context.push('/order_confirmation');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Order Placed! Navigating to /order_confirmation')),
        );
        // Assuming a route named '/order_confirmation' exists.
        context.push('/order_confirmation'); 
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFC67C4E), // Figma ID 142:107
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.symmetric(
            vertical: screenWidth * (16 / 375)), // Consistent with Figma padding
        minimumSize: Size(screenWidth * (327 / 375), 56), // Fixed height, responsive width for inner button
        elevation: 0,
      ),
      child: Text(
        'Order',
        style: GoogleFonts.sora(
          fontSize: screenWidth * (16 / 375),
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}

// Helper to remove ':' and ';' from image IDs for asset paths
String _getImageAssetPath(String figmaId) {
  // Replace ':' and ';' with '_' as per requirements
  return 'assets/images/${figmaId.replaceAll(':', '_').replaceAll(';', '_')}.png';
}