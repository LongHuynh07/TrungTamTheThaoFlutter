class CartItem {
  final int? id;
  final String imagePath;
  final String price;
  final String rating;
  final String description;
  final String area;
  final String courtType;

  CartItem({
    this.id,
    required this.imagePath,
    required this.price,
    required this.rating,
    required this.description,
    required this.area,
    required this.courtType,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imagePath': imagePath,
      'price': price,
      'rating': rating,
      'description': description,
      'area': area,
      'courtType': courtType,
    };
  }
}
