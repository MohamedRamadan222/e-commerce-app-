List<ProductsModel> productsModelFromJson(dynamic str) =>
    List<ProductsModel>.from(
      (str as List).map(
        (x) => ProductsModel.fromJson(x as Map<String, dynamic>),
      ),
    );

class ProductsModel {
  int? id;
  String? title;
  double? price;
  String? description;
  Category? category;
  String? image;
  Rating? rating;

  ProductsModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
    id: json["id"] as int?,
    title: json["title"] as String?,
    price: (json["price"] != null) ? (json["price"] as num).toDouble() : null,
    description: json["description"] as String?,
    category: json["category"] != null
        ? categoryValues.map[json["category"]]
        : null,
    image: json["image"] as String?,
    rating: json["rating"] != null
        ? Rating.fromJson(json["rating"] as Map<String, dynamic>)
        : null,
  );
}

enum Category { electronics, jewelery, mensClothing, womensClothing }

final categoryValues = EnumValues<Category>({
  "electronics": Category.electronics,
  "jewelery": Category.jewelery,
  "men's clothing": Category.mensClothing,
  "women's clothing": Category.womensClothing,
});

class Rating {
  double? rate;
  int? count;

  Rating({this.rate, this.count});

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    rate: (json["rate"] != null) ? (json["rate"] as num).toDouble() : null,
    count: json["count"] as int?,
  );
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
