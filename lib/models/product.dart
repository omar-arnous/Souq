class Product {
  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
  });

  final String id;
  final String title;
  final String description;
  final String price;
  final String image;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        price: json['price'],
        image: json['imageUrl'],
      );
}
