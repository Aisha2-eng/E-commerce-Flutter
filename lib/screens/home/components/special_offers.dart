import 'package:flutter/material.dart';


class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
                "Offers",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 27, 25, 25),
                ),
              ),
        SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SpecialOfferCard(
                image: "assets/images/Image Banner 2.png",
                category: "Sweet Touches \n All Cake",
                numOfBrands: 50,
                
              ),
              SpecialOfferCard(
                image: "assets/images/Image Banner 3.png",
                category: "Sweet Touches \n Cookies",
                numOfBrands: 20,
                // press: () {
                //   Navigator.pushNamed(context, ProductsScreen.routeName);
                // },
              ),
              SpecialOfferCard(
                image: "assets/images/Image Banner 3.png",
                category: "Black Friday",
                numOfBrands: 70,
                // press: () {
                //   Navigator.pushNamed(context, ProductsScreen.routeName);
                // },
              ),
              SpecialOfferCard(
                image: "assets/images/Image Banner 3.png",
                category: "Special Offer",
                numOfBrands: 30,
                // press: () {
                //   Navigator.pushNamed(context, ProductsScreen.routeName);
                // },
              ),
              SizedBox(width: 20),
            ],
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key? key,
    required this.category,
    required this.image,
    required this.numOfBrands,
    //required this.press,
  }) : super(key: key);

  final String category, image;
  final int numOfBrands;
  //final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: GestureDetector(
        //onTap: press,
        child: SizedBox(
          width: 242,
          height: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black54,
                        Colors.black38,
                        Colors.black26,
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: const TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$category\n",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: "$numOfBrands% OFF")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
