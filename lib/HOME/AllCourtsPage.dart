import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Database/database_helper.dart';
import '../models/cart_item.dart';
import '../screen/CartPage.dart';

class AllCourtsPage extends StatefulWidget {
  const AllCourtsPage({super.key});

  @override
  State<AllCourtsPage> createState() => AllCourtsPageState();
}

class AllCourtsPageState extends State<AllCourtsPage> {
  void navigateToDetailPage(BuildContext context, String imagePath, String price, String rating, String description, String area, String courtType) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(
          imagePath: imagePath,
          price: price,
          rating: rating,
          description: description,
          area: area,
          courtType: courtType,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Recently Viewed',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22, // Font size
          ),
        ),
        centerTitle: true, // Centers the title
        backgroundColor: Colors.white, // White background color
        iconTheme: const IconThemeData(
          color: Colors.black, // Icon color
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(11.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Add your filter functionality here
                  },
                  icon: const Icon(Icons.filter_list_alt, size: 28), // Icon size
                  label: const Text('Filter', style: TextStyle(fontSize: 18)), // Font size
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xFF003366), // Dark blue color
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12), // Button size
                    textStyle: const TextStyle(fontSize: 18), // Text size
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Rounded corners
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Add your sort functionality here
                  },
                  icon: const Icon(Icons.sort, size: 28), // Icon size
                  label: const Text('Sort', style: TextStyle(fontSize: 18)), // Font size
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xFF003366), // Dark blue color
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12), // Button size
                    textStyle: const TextStyle(fontSize: 18), // Text size
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Rounded corners
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildProductItem(
                  context,
                  'assets/san2.jpg',
                  '₫100.000',
                  '5',
                  'Product details go here. This is a brief description of the product.',
                  '500m²',
                  '5-a-side',
                ),
                _buildProductItem(
                  context,
                  'assets/san3.jpg',
                  '₫500.000',
                  '4.5',
                  'Product details go here. This is a brief description of the product.',
                  '700m²',
                  '7-a-side',
                ),
                _buildProductItem(
                  context,
                  'assets/san4.jpg',
                  '₫550.000',
                  '4.9',
                  'Product details go here. This is a brief description of the product.',
                  '800m²',
                  '5-a-side',
                ),
                _buildProductItem(
                  context,
                  'assets/san1.jpg',
                  '₫1,000,000',
                  '4.0',
                  'Product details go here. This is a brief description of the product.',
                  '900m²',
                  '7-a-side',
                ),
                _buildProductItem(
                  context,
                  'assets/sanbongro.jpg',
                  '₫2,300,000',
                  '4.5',
                  'Product details go here. This is a brief description of the product.',
                  '1000m²',
                  '5-a-side',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductItem(BuildContext context, String imagePath, String price, String rating, String description, String area, String courtType) {
    return Padding(
      padding: const EdgeInsets.all(11.0),
      child: GestureDetector(
        onTap: () {
          navigateToDetailPage(context, imagePath, price, rating, description, area, courtType);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      imagePath,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          price,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              rating,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Icon(Icons.star, color: Colors.yellow),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.favorite_border),
                      color: Colors.red,
                      onPressed: () {
                        // Add your like functionality here
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  description,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class DetailPage extends StatelessWidget {
  final String imagePath;
  final String price;
  final String rating;
  final String description;
  final String area;
  final String courtType;

  const DetailPage({
    super.key,
    required this.imagePath,
    required this.price,
    required this.rating,
    required this.description,
    required this.area,
    required this.courtType,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Page',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22, // Font size
          ),
        ),
        centerTitle: true, // Centers the title
        backgroundColor: Colors.white, // White background color
        iconTheme: const IconThemeData(
          color: Colors.black, // Icon color
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                imagePath,
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              price,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  rating,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Icon(Icons.star, color: Colors.yellow),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Area: $area',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Court Type: $courtType',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Text(
              description,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _showBookingSuccessDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFF003366),
                  // Dark blue color
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 20),
                  // Button size
                  textStyle: const TextStyle(fontSize: 20),
                  // Text size
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Rounded corners
                  ),
                ),
                child: const Text('Đặt Sân'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showBookingSuccessDialog(BuildContext context) async {
    CartItem cartItem = CartItem(
      imagePath: imagePath,
      price: price,
      rating: rating,
      description: description,
      area: area,
      courtType: courtType,
    );

    await DatabaseHelper.instance.insertCartItem(cartItem.toMap());

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Đặt Sân Thành Công'),
          content: const Text('Sân của bạn đã được đặt thành công'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (
                        context) => const Cartpage(), // Ensure the correct class name is used here
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}





