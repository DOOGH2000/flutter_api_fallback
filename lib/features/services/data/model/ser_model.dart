class ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
  });

  factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        description: json["description"],
      );

  static List<ProductModel> fromListOfJson(List data) {
    return List.from(
        data.map((items) => ProductModel.fromMap(items)).toList());
  }
}
