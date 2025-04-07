class Category {
  final String title;
  final String image;

  Category({
    required this.title,
    required this.image,
  });
}

final List<Category> categoriesList = [
  Category(
    title: "All",
    image: "assets/images/glap.png",
  ),
  Category(
    title: "Cake",
    image: "assets/images/shoes2.png",
  ),
  Category(
    title: "Cookies",
    image: "assets/images/glap.png",
  ),
  Category(
    title: "Macarons",
    image: "assets/images/shoes2.png",
  ),
  Category(
    title: "Chocolate",
    image: "assets/images/tshirt.png",
  ),
  
];