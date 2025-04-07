import 'package:flutter/material.dart';
import 'package:shop_app/screens/shop_page/shop-home.dart';

class Services extends StatefulWidget {
  const Services({super.key});

  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  final List<bool> _isHovered = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    const kPrimaryColor = Color.fromARGB(255, 228, 118, 118); // Primary color

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Text(
                "Categories",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 27, 25, 25),
                ),
              ),
              SizedBox(
                height: 120,
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildHoverableItem(
                        0,
                        'assets/icons/categories/3d-house.png',
                        'General',
                        kPrimaryColor),
                    _buildHoverableItem(
                        1,
                        'assets/icons/categories/pancake.png',
                        'Sweets',
                        kPrimaryColor),
                    _buildHoverableItem(2, 'assets/icons/categories/ring.png',
                        'Jewelry', kPrimaryColor),
                    _buildHoverableItem(
                        3,
                        'assets/icons/categories/tree-toys.png',
                        'Toys',
                        kPrimaryColor),
                  ].divide(const SizedBox(width: 20)),
                ),
              ),
            ].divide(const SizedBox(height: 20)),
          ),
        ),
      ),
    );
  }

  Widget _buildHoverableItem(
      int index, String image, String label, Color kPrimaryColor) {
    return GestureDetector(
      onTap: () {
        // Navigate to different pages based on the index
        switch (index) {
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ShopScreen()),
            );
            break;
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ShopScreen()),
            );
            break;
          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ShopScreen()),
            );
            break;
          case 3:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ShopScreen()),
            );
            break;
        }
      },
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered[index] = true),
        onExit: (_) => setState(() => _isHovered[index] = false),
        cursor: SystemMouseCursors.click,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 84,
              height: 84,
              decoration: BoxDecoration(
                color: _isHovered[index]
                    ? const Color.fromARGB(255, 243, 169, 222)
                    : const Color(0xFFE3E5EC),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(image),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontFamily: 'Inter',
                color: kPrimaryColor,
                fontSize: 16,
                letterSpacing: 0.1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension on List<Widget> {
  List<Widget> divide(SizedBox sizedBox) {
    if (isEmpty) return this;
    return [
      for (int i = 0; i < length; i++) ...[
        this[i],
        if (i < length - 1) sizedBox,
      ],
    ];
  }
}
