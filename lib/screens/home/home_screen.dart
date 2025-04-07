import 'package:flutter/material.dart';

//import 'components/categories.dart';
import 'components/discount_banner.dart';
import 'components/home_header.dart';
import 'components/contact_form.dart';
import 'components/special_offers.dart';
import 'components/Services.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
   
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              
              HomeHero(),//home Header 
              SizedBox(height: 25),
              SpecialOffers(),
              SizedBox(height: 25),
              Services(),// Categories
              SizedBox(height: 25), // Add spacing between sections
              ContactForm(),
             // SizedBox(height: 20),  

              // SizedBox(height: 20),
              // PopularProducts(),
              // SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
