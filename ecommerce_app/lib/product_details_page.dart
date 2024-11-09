import 'package:ecommerce_app/home.dart';
import 'package:flutter/material.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int quantity = 1;
  int currentImageIndex = 0; // To manage the selected image indicator
  Color selectedColor = Colors.black;

  num? selectedSize; // Track selected size

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black),
            onPressed: () {},
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image with circular heart icon and bullet indicators
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 250,
                    child: PageView(
                      onPageChanged: (index) {
                        setState(() {
                          currentImageIndex = index;
                        });
                      },
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Image.asset('assets/images/dark-blue.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Image.asset('assets/images/blue.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Image.asset('assets/images/black.png'),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.favorite_border,
                          color: Colors.black),
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          width: currentImageIndex == index ? 12 : 8,
                          height: currentImageIndex == index ? 12 : 8,
                          decoration: BoxDecoration(
                            color: currentImageIndex == index
                                ? Colors.black
                                : Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Axel Arigato",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold)),
                          Text("Clean 90 Triple Sneakers",
                              style: TextStyle(color: Colors.grey[600])),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.star,
                                  color: Colors.orange, size: 16),
                              const Icon(Icons.star,
                                  color: Colors.orange, size: 16),
                              const Icon(Icons.star,
                                  color: Colors.orange, size: 16),
                              const Icon(Icons.star,
                                  color: Colors.orange, size: 16),
                              const Icon(Icons.star,
                                  color: Colors.orange, size: 16),
                              const SizedBox(width: 4),
                              Text(" (270 Review)",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[600])),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                _buildQuantityButton(Icons.remove, () {
                                  setState(() {
                                    if (quantity > 1) quantity--;
                                  });
                                }),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    "$quantity",
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                _buildQuantityButton(Icons.add, () {
                                  setState(() {
                                    quantity++;
                                  });
                                }),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Available in stock",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),

                  // Size and Color Selection in a Row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Size Selection
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Size",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 8),
                            Wrap(
                              spacing: 8.0,
                              children: [39, 40, 41, 42].map((size) {
                                return ChoiceChip(
                                  backgroundColor: Colors.white,
                                  label: Text(size.toString()),
                                  selected: selectedSize == size,
                                  onSelected: (bool selected) {
                                    setState(() {
                                      selectedSize = selected ? size : null;
                                    });
                                  },
                                  selectedColor: Colors.blue,
                                  checkmarkColor: Colors.white,
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),

                      // Color Selection (Vertical alignment)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 2,
                                  blurRadius: 8,
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                _buildColorOption(Colors.grey.shade300),
                                const SizedBox(height: 8),
                                _buildColorOption(Colors.black),
                                const SizedBox(height: 8),
                                _buildColorOption(Colors.blueGrey),
                                const SizedBox(height: 8),
                                _buildColorOption(Colors.blue),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Description
                  const Text("Description",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(
                    "Engineered to crush any movement-based workout, these sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a pair.",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 24),

                  // Total Price and Add to Cart Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Total Price",
                              style: TextStyle(
                                  fontSize: 11, color: Colors.grey[600])),
                          const Text("\$245.00",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 14),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.shopping_bag_outlined,
                              color: Colors.white,
                            ),
                            SizedBox(width: 8),
                            Text(
                              "Add to cart",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColorOption(Color color) {
    bool isSelected = color == selectedColor;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = color;
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey),
              // border:
              //     isSelected ? Border.all(color: Colors.black, width: 2) : null,
            ),
          ),
          if (isSelected)
            const Icon(Icons.check, color: Colors.white, size: 10),
        ],
      ),
    );
  }

  Widget _buildQuantityButton(IconData icon, VoidCallback onPressed) {
    return Container(
      width: 28,
      height: 28,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, size: 12),
        onPressed: onPressed,
      ),
    );
  }
}
