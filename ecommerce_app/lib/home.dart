import 'package:ecommerce_app/product_details_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  Widget _buildIconWithLabelInCircle(
      IconData iconData, String label, bool isSelected) {
    Color backgroundColor = isSelected ? Colors.black : Colors.grey.shade300;
    Color textColor = isSelected ? Colors.white : Colors.black;
    Color iconColor = isSelected ? Colors.black : Colors.white;
    Color iconBgColor = isSelected ? Colors.white : Colors.black;

    return Container(
      // padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      padding: const EdgeInsets.only(right: 14.0),
      decoration: BoxDecoration(
        color: backgroundColor, // Circle background color
        borderRadius:
            BorderRadius.circular(30), // Circular radius for container
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, // Ensure minimal space for the row
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: iconBgColor, // Circle background color
              shape: BoxShape.circle,
            ),
            child: Icon(
              iconData,
              color: iconColor, // Icon color
            ),
          ),
          // Icon(iconData, color: iconColor),
          const SizedBox(width: 5),
          Text(
            label,
            style: TextStyle(
              color: textColor,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.menu, color: Colors.black),
        actions: const [
          Icon(Icons.search, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Discount Banners
            Row(
              children: [
                _buildDiscountBanner(2, "50% Off", "On everything today",
                    "With code: FS_CREATION"),
              ],
            ),
            const SizedBox(height: 10),
            // New Arrivals Section
            _buildSectionHeader("New Arrivals"),
            Row(
              children: [
                _buildProductCard("The Marc Jacobs", "Traveler Tote",
                    "\$195.00", 'assets/images/bag.png'),
                const SizedBox(width: 8),
                _buildProductCard("Axel Arigato", "Clean 90 Triple Sneakers",
                    "\$245.00", 'assets/images/dark-blue.png'),
              ],
            ),
            const SizedBox(height: 10),
            // Popular Section
            _buildSectionHeader("Popular"),
            const SizedBox(height: 10),
            _buildPopularProductCard(
                "Gia Borghini", "RHW Rosie 1 Sandals", "\$740.00", 3.5),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white, // Set background color here
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), // Adjust radius as needed
            topRight: Radius.circular(20), // Adjust radius as needed
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, -1),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            iconSize: 12,
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: _buildIconWithLabelInCircle(
                    Icons.home, 'Home', _selectedIndex == 0),
                label: '',
                activeIcon:
                    _buildIconWithLabelInCircle(Icons.home, 'Home', true),
              ),
              BottomNavigationBarItem(
                icon: _buildIconWithLabelInCircle(
                    Icons.person, 'User', _selectedIndex == 1),
                label: '',
                activeIcon:
                    _buildIconWithLabelInCircle(Icons.person, 'User', true),
              ),
              BottomNavigationBarItem(
                icon: _buildIconWithLabelInCircle(
                    Icons.favorite, 'Favorites', _selectedIndex == 2),
                label: '',
                activeIcon: _buildIconWithLabelInCircle(
                    Icons.favorite, 'Favorites', true),
              ),
              BottomNavigationBarItem(
                icon: _buildIconWithLabelInCircle(
                    Icons.shopping_cart, 'Cart', _selectedIndex == 3),
                label: '',
                activeIcon: _buildIconWithLabelInCircle(
                    Icons.shopping_cart, 'Cart', true),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: ClipRRect(
      //   borderRadius: const BorderRadius.only(
      //     topRight: Radius.circular(24),
      //     topLeft: Radius.circular(24),
      //   ),
      //   child: BottomNavigationBar(
      //     elevation: 2,
      //     backgroundColor: Colors.white,
      //     iconSize: 12,
      //     type: BottomNavigationBarType.fixed,
      //     currentIndex: _selectedIndex,
      //     onTap: _onItemTapped,
      //     items: <BottomNavigationBarItem>[
      //       BottomNavigationBarItem(
      //         icon: _buildIconWithLabelInCircle(
      //             Icons.home, 'Home', _selectedIndex == 0),
      //         label: '',
      //         activeIcon: _buildIconWithLabelInCircle(Icons.home, 'Home', true),
      //       ),
      //       BottomNavigationBarItem(
      //         icon: _buildIconWithLabelInCircle(
      //             Icons.person, 'User', _selectedIndex == 1),
      //         label: '',
      //         activeIcon:
      //             _buildIconWithLabelInCircle(Icons.person, 'User', true),
      //       ),
      //       BottomNavigationBarItem(
      //         icon: _buildIconWithLabelInCircle(
      //             Icons.favorite, 'Favorites', _selectedIndex == 2),
      //         label: '',
      //         activeIcon: _buildIconWithLabelInCircle(
      //             Icons.favorite, 'Favorites', true),
      //       ),
      //       BottomNavigationBarItem(
      //         icon: _buildIconWithLabelInCircle(
      //             Icons.shopping_cart, 'Cart', _selectedIndex == 3),
      //         label: '',
      //         activeIcon: _buildIconWithLabelInCircle(
      //             Icons.shopping_cart, 'Cart', true),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

  Widget _buildDiscountBanner(
      int flexvalue, String title, String subtitle, String code) {
    return Expanded(
      flex: flexvalue,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
          image: const DecorationImage(
              image: AssetImage("assets/images/banner.png"), fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(subtitle,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(code, style: TextStyle(fontSize: 11, color: Colors.grey[700])),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.black,
                textStyle: const TextStyle(fontSize: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
              ),
              child: const Text("Get Now"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        TextButton(
          onPressed: () {},
          child: const Text("View All", style: TextStyle(color: Colors.black)),
        ),
      ],
    );
  }

  Widget _buildProductCard(
      String title, String subtitle, String price, String imagePath) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProductDetailsPage()),
          );
        },
        child: Stack(
          children: [
            Container(
              // padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                // color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: 1.0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Image.asset(imagePath),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(title,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(subtitle,
                      style: TextStyle(fontSize: 13, color: Colors.grey[600])),
                  const SizedBox(height: 4),
                  Text(price,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Positioned(
              top: 12,
              right: 12,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.favorite_border,
                    size: 12, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPopularProductCard(
      String title, String subtitle, String price, double rating) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Image.asset('assets/images/heel.png'),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(subtitle,
                    style: TextStyle(fontSize: 11, color: Colors.grey[600])),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.orange, size: 12),
                    const Icon(Icons.star, color: Colors.orange, size: 12),
                    const Icon(Icons.star, color: Colors.orange, size: 12),
                    const Icon(Icons.star_half, color: Colors.orange, size: 12),
                    const Icon(Icons.star, color: Colors.grey, size: 12),
                    const SizedBox(width: 4),
                    Text('($rating)',
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ],
                ),
              ],
            ),
          ),
          Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
