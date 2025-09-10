import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

/// Represents a single coffee product in the app.
class CoffeeProduct {
  final String id;
  final String name;
  final String description;
  final double rating;
  final double price;
  final String imagePath;

  CoffeeProduct({
    required this.id,
    required this.name,
    required this.description,
    required this.rating,
    required this.price,
    required this.imagePath,
  });
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // For bottom navigation
  int _selectedCategoryIndex = 0; // For coffee categories

  // Define colors based on Figma's hex/RGB values
  static const Color primaryColor = Color(0xFFC67C4E);
  static const Color darkBackgroundColor = Color(0xFF2F2D2C);
  static const Color darkerBackgroundColor = Color(0xFF333333);
  static const Color whiteTextColor = Colors.white;
  static const Color greyTextColor = Color(0xFFA9A9A9);
  static const Color lightGreyBackground = Color(0x59EEEEEE); // Opacity 35%
  static const Color starColor = Color(0xFFFCBE2B);
  static const Color promoRedColor = Color(0xFFED4949);
  static const Color cardBackgroundColor = Colors.white;
  static const Color blackTextColor = Color(0xFF232323); // From price text (0.0196... a:1 -> 0xFF232323)
  static const Color scaffoldBackgroundColor = Color(0xFFF9F9F9); // General background

  final List<String> categories = [
    'All Coffee',
    'Machiato',
    'Latte',
    'Americano',
  ];

  final List<CoffeeProduct> coffeeProducts = [
    CoffeeProduct(
      id: '154:319',
      name: 'Caffe Mocha',
      description: 'Deep Foam',
      rating: 4.8,
      price: 4.53,
      imagePath: 'assets/images/I154_321_417_715.png',
    ),
    CoffeeProduct(
      id: '154:335',
      name: 'Flat White',
      description: 'Espresso',
      rating: 4.8,
      price: 3.53,
      imagePath: 'assets/images/I154_337_417_717.png',
    ),
    CoffeeProduct(
      id: '154:367',
      name: 'Mocha Fusi',
      description: 'Ice/Hot',
      rating: 4.8,
      price: 7.53,
      imagePath: 'assets/images/I154_369_417_716.png',
    ),
    CoffeeProduct(
      id: '154:351',
      name: 'Caffe Panna',
      description: 'Ice/Hot',
      rating: 4.8,
      price: 5.53,
      imagePath: 'assets/images/I154_353_417_718.png',
    ),
    CoffeeProduct(
      id: '154:dummy1',
      name: 'Espresso Delight',
      description: 'Rich & Bold',
      rating: 4.7,
      price: 4.00,
      imagePath: 'assets/images/I154_291_418_950.png',
    ),
    CoffeeProduct(
      id: '154:dummy2',
      name: 'Caramel Latte',
      description: 'Sweet Treat',
      rating: 4.9,
      price: 5.25,
      imagePath: 'assets/images/I154_293_418_971.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final statusBarHeight = mediaQuery.padding.top;

    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      body: Stack(
        children: [
          // Background gradient for the top section, fixed height
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screenHeight * 0.35, // Approximately 280 / 812 total height
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    darkBackgroundColor,
                    darkerBackgroundColor,
                  ],
                ),
              ),
            ),
          ),
          // Main content column, including the scrollable part
          Column(
            children: [
              SizedBox(height: statusBarHeight), // Status bar padding

              // Status Bar Time
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 4.0),
                child: Row(
                  children: [
                    Text(
                      '9:41', // Placeholder for time
                      style: GoogleFonts.sora(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: whiteTextColor,
                      ),
                    ),
                    const Spacer(),
                    // Placeholder for other status icons (Wifi, Battery, Signal)
                    const Icon(Icons.wifi, color: whiteTextColor, size: 16),
                    const SizedBox(width: 4),
                    const Icon(Icons.signal_cellular_alt, color: whiteTextColor, size: 16),
                    const SizedBox(width: 4),
                    const Icon(Icons.battery_full, color: whiteTextColor, size: 16),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              // Location & Profile
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Location',
                          style: GoogleFonts.sora(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: greyTextColor,
                            letterSpacing: 0.12,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              'Bilzen, Tanjungbalai',
                              style: GoogleFonts.sora(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: whiteTextColor,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: whiteTextColor,
                              size: 14,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // Figma asset I142:500;417:719
                        image: const DecorationImage(
                          image: AssetImage('assets/images/I142_500_417_719.png'),
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(color: Colors.white, width: 2), // Example border
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Search Bar & Filter
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 52,
                        decoration: BoxDecoration(
                          color: const Color(0xFF1F1F1F),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            const Icon(Icons.search, color: greyTextColor),
                            const SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                style: GoogleFonts.sora(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: greyTextColor,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Search coffee',
                                  hintStyle: GoogleFonts.sora(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: greyTextColor,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    GestureDetector(
                      onTap: () {
                        // Handle filter tap
                        // context.push('/filter_screen'); // Example navigation
                      },
                      child: Container(
                        width: 52,
                        height: 52,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.filter_list, color: whiteTextColor),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Banner
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Container(
                  width: double.infinity,
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/154_387.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                          decoration: BoxDecoration(
                            color: promoRedColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'Promo',
                            style: GoogleFonts.sora(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: whiteTextColor,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'Buy one get one FREE',
                          style: GoogleFonts.sora(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            color: whiteTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Categories and Product Grid (Scrollable Section)
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 24), // Spacing from banner
                  decoration: const BoxDecoration(
                    color: scaffoldBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Categories filter buttons
                        Padding(
                          padding: const EdgeInsets.only(left: 24.0, top: 24.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(categories.length, (index) {
                                final isSelected = _selectedCategoryIndex == index;
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedCategoryIndex = index;
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 8),
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                    decoration: BoxDecoration(
                                      color: isSelected ? primaryColor : lightGreyBackground,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      categories[index],
                                      style: GoogleFonts.sora(
                                        fontSize: 14,
                                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                                        color: isSelected ? whiteTextColor : greyTextColor,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Product Grid
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              final itemWidth = (constraints.maxWidth - 16) / 2;
                              // Approximate aspect ratio (width / height)
                              // 156 / 238 in Figma is approx 0.65.
                              // So height is roughly itemWidth / 0.65 = itemWidth * 1.53
                              return GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(), // To allow parent SingleChildScrollView to scroll
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 16,
                                  childAspectRatio: itemWidth / (itemWidth * 1.53),
                                ),
                                itemCount: coffeeProducts.length,
                                itemBuilder: (context, index) {
                                  final product = coffeeProducts[index];
                                  return GestureDetector(
                                    onTap: () {
                                      context.push('/product_detail', extra: product);
                                    },
                                    child: CoffeeCard(product: product),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 24 + 99), // Add extra space for bottom nav bar
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Bottom Navigation Bar - Fixed at the bottom
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 99, // Fixed height from Figma
              decoration: const BoxDecoration(
                color: cardBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildBottomNavItem(Icons.home_rounded, 0, '/home'),
                  _buildBottomNavItem(Icons.favorite_border, 1, '/favorites'),
                  _buildBottomNavItem(Icons.shopping_bag_outlined, 2, '/cart'),
                  _buildBottomNavItem(Icons.notifications_none, 3, '/notifications'),
                ],
              ),
            ),
          ),
          // Home Indicator at the very bottom
          Positioned(
            bottom: 8, // Roughly 34 (height) - 5 (indicator height) = 29. Centered in 34.
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 134,
                height: 5,
                decoration: BoxDecoration(
                  color: blackTextColor,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method for building bottom navigation items
  Widget _buildBottomNavItem(IconData icon, int index, String routeName) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        context.go(routeName); // Use context.go for bottom navigation tabs
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? primaryColor : greyTextColor,
            size: 24,
          ),
          if (isSelected)
            Container(
              margin: const EdgeInsets.only(top: 6),
              width: 10,
              height: 5,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(18), // Fully rounded rect
              ),
            ),
        ],
      ),
    );
  }
}

/// A widget to display a single coffee product card.
class CoffeeCard extends StatelessWidget {
  final CoffeeProduct product;

  const CoffeeCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _HomePageState.cardBackgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image & Rating
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    product.imagePath,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          _HomePageState.darkBackgroundColor,
                          _HomePageState.darkerBackgroundColor,
                        ],
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.star_rounded, color: _HomePageState.starColor, size: 12),
                        const SizedBox(width: 4),
                        Text(
                          '${product.rating}',
                          style: GoogleFonts.sora(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: _HomePageState.whiteTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          // Product Details
          Text(
            product.name,
            style: GoogleFonts.sora(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: _HomePageState.blackTextColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            product.description,
            style: GoogleFonts.sora(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: _HomePageState.greyTextColor,
            ),
          ),
          const Spacer(), // Pushes price and button to bottom
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$ ${product.price.toStringAsFixed(2)}',
                style: GoogleFonts.sora(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: _HomePageState.blackTextColor,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Handle add to cart functionality
                  // Example: show a snackbar or add to a cart state management system
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text('Added ${product.name} to cart!'),
                        duration: const Duration(milliseconds: 800)),
                  );
                },
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: _HomePageState.primaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.add, color: _HomePageState.whiteTextColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}