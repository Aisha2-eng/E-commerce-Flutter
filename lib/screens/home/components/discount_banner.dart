import 'package:flutter/material.dart';

class HomeHero extends StatelessWidget {
  const HomeHero({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 45,
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0x7FD0828B), // #d0828b49 (with 30% opacity)
            Color(0xFFFFFFFF), // #ffffff
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Text content
          const Expanded(
            child: Text.rich(
              TextSpan(
                style: TextStyle(color: Colors.white),
                children: [
                  TextSpan(text: "Welcome to \n"),
                  TextSpan(
                    text: "DESIGNFY",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(text: "\nits about design and costom your order as you like"),
                ],
              ),
            ),
          ),

          // Image next to the text
          Image.asset(
            'assets/images/splash_1.png', // Update this path to your image
            width: 130,
            height: 130,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
