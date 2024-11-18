import 'dart:convert';

List<GetProduct> getProductFromJson(String str) =>
    List<GetProduct>.from(json.decode(str).map((x) => GetProduct.fromJson(x)));

String getProductToJson(List<GetProduct> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetProduct {
  String? id;
  Category? category;
  String? getProductId;
  String? name;
  String? description;
  int? price;
  String? image;
  List<String>? sizes;

  GetProduct({
    this.id,
    this.category,
    this.getProductId,
    this.name,
    this.description,
    this.price,
    this.image,
    this.sizes,
  });

  factory GetProduct.fromJson(Map<String, dynamic> json) => GetProduct(
        id: json["_id"],
        category: categoryValues.map[json["category"]],
        getProductId: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        image: json["image"],
        sizes: json["sizes"] != null
            ? List<String>.from(json["sizes"].map((x) => x))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "category": categoryValues.reverse[category],
        "id": getProductId,
        "name": name,
        "description": description,
        "price": price,
        "image": image,
        "sizes": sizes != null ? List<dynamic>.from(sizes!.map((x) => x)) : [],
      };
}

enum Category { SHOES, SUNGLASSES, WATCHES }

final categoryValues = EnumValues({
  "shoes": Category.SHOES,
  "sunglasses": Category.SUNGLASSES,
  "watches": Category.WATCHES
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
