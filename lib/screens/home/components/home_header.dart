import 'package:flutter/material.dart';
import '../../cart/cart_screen.dart';
import '../../home/home_screen.dart'; // Import HomeScreen for navigation
import 'icon_btn_with_counter.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context)
          .scaffoldBackgroundColor, // Matches AppBar background
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Title as a button
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, HomeScreen.routeName),
            child: Text(
              'DESIGNFY',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontFamily: 'DynaPuff', // Matches your custom font
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600, // Similar to your template
                  ),
            ),
          ),

          // Icon Button
          IconBtnWithCounter(
            svgSrc: "assets/icons/Cart Icon.svg",
            press: () => Navigator.pushNamed(context, CartScreen.routeName),
          ),
        ],
      ),
    );
  }
}
