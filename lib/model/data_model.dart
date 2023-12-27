class ProductDataModel {
  ProductDataModel({
    required this.id,
    required this.name,
    required this.price,
    required this.size,
    required this.color,
    required this.imageUrl,
  });
  final String id;
  final String name;
  final double price;
  final String size;
  final String color;
  final String imageUrl;

  factory ProductDataModel.fromjson(Map<String, dynamic> json) {
    return ProductDataModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      size: json['size'],
      color: json['color'],
      imageUrl: json['imageUrl'],
    );
  }
}