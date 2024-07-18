class ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String catalog;
  final String category;
  final List<String> images;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.catalog,
    required this.category,
    required this.images,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    var imagesFromJson = json['images'];
    List<String> imagesList =
        imagesFromJson != null ? List<String>.from(imagesFromJson) : [];

    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      catalog: json['catalog'],
      category: json['category'],
      images: imagesList,
    );
  }
}
