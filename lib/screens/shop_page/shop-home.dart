import 'package:flutter/material.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/screens/shop_page/widget/product_cart.dart';
import 'package:shop_app/screens/shop_page/widget/search_bar.dart';
import '../../models/category.dart';
import 'widget/image_slider.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  int currentSlider = 0;
  int selectedIndex = 0;

  final TextEditingController minPriceController = TextEditingController();
  final TextEditingController maxPriceController = TextEditingController();

  String selectedFilter = "For You"; // Default filter
  String selectedSortOption = "Rating"; // Default sorting option

  bool isAvailable = false;
  bool is3DModel = false;
  bool isCustomizable = false;

  @override
  Widget build(BuildContext context) {
    List<List<Product>> selectcategories = [
      all,
      cake,
      macrons,
      chocolate,
      cookies,
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar
              const MySearchBAR(),
              const SizedBox(height: 20),

              // Image slider
              // ImageSlider(
              //   currentSlide: currentSlider,
              //   onChange: (value) {
              //     setState(() {
              //       currentSlider = value;
              //     });
              //   },
              // ),
              // const SizedBox(height: 20),

              // Category selection
              categoryItems(),
              // Product options
              productOptions(),

              // Filters and sorting in a styled box
              filterAndSortBox(),

              // Shopping items
              const SizedBox(height: 10),
              GridView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: selectcategories[selectedIndex].length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: selectcategories[selectedIndex][index],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget productOptions() {
  return Card(
    elevation: 3,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          const Text(
            "Product Options",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          
          // Checkboxes
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Checkbox(
                      value: isAvailable,
                      onChanged: (value) {
                        setState(() {
                          isAvailable = value!;
                        });
                      },
                    ),
                    const Text("Available" , 
                    style: TextStyle(
                     fontSize: 12,
                  ),
                  ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Checkbox(
                      value: is3DModel,
                      onChanged: (value) {
                        setState(() {
                          is3DModel = value!;
                        });
                      },
                    ),
                    const Text("3D Model",
                    style: TextStyle(
                    fontSize: 12,
                    ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Checkbox(
                      value: isCustomizable,
                      onChanged: (value) {
                        setState(() {
                          isCustomizable = value!;
                        });
                      },
                    ),
                    const Text("Customizable", 
                    style: TextStyle(
                    fontSize: 12,
                    ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          
        ],
      ),
    ),
  );
}


  Widget filterAndSortBox() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            const Text(
              "Filters and Sorting",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 10),
            // Filter and sorting dropdowns
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey[200], // Background color
                      borderRadius:
                          BorderRadius.circular(20), // Rounded corners
                      border: Border.all(color: Colors.grey[400]!), // Border
                    ),
                    child: DropdownButton<String>(
                      value: selectedFilter,
                      onChanged: (value) {
                        setState(() {
                          selectedFilter = value!;
                        });
                      },
                      items: ["For You", "The Latest", "Top Seller"]
                          .map((filter) => DropdownMenuItem(
                                value: filter,
                                child: Text(filter),
                              ))
                          .toList(),
                    ),
                  ),
                ),
                const SizedBox(width: 40),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey[200], // Background color
                      borderRadius:
                          BorderRadius.circular(20), // Rounded corners
                      border: Border.all(color: Colors.grey[400]!), // Border
                    ),
                    child: DropdownButton<String>(
                      value: selectedSortOption,
                      onChanged: (value) {
                        setState(() {
                          selectedSortOption = value!;
                        });
                      },
                      items: ["Rating", "Price"]
                          .map((sort) => DropdownMenuItem(
                                value: sort,
                                child: Text(sort),
                              ))
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  SizedBox categoryItems() {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: selectedIndex == index
                          ? const Color.fromARGB(255, 249, 150, 202)
                          : Colors.grey.shade300,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 4,
                        offset: const Offset(2, 2), // Shadow position
                      ),
                    ],
                  ),
                  child: Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(categoriesList[index].image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  categoriesList[index].title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: selectedIndex == index
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
