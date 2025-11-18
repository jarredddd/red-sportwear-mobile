// To parse this JSON data, do
//
//     final productEntry = productEntryFromJson(jsonString);

import 'dart:convert';

List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(json.decode(str).map((x) => ProductEntry.fromJson(x)));

String productEntryToJson(List<ProductEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
  String id;
  String name;
  String description;
  int price;
  int stok;
  String category;
  String? thumbnail;
  int newsViews;
  DateTime createdAt;
  bool isFeatured;
  int userId;
  String? userUsername;

  ProductEntry({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.stok,
    required this.category,
    required this.thumbnail,
    required this.newsViews,
    required this.createdAt,
    required this.isFeatured,
    required this.userId,
    required this.userUsername,
  });

  factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    price: json["price"],
    stok: json["stok"],
    category: json["category"],
    thumbnail: json["thumbnail"],
    newsViews: json["news_views"],
    createdAt: DateTime.parse(json["created_at"]),
    isFeatured: json["is_featured"],
    userId: json["user_id"],
    userUsername: json['user_username'] as String?,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "price": price,
    "stok": stok,
    "category": category,
    "thumbnail": thumbnail,
    "news_views": newsViews,
    "created_at": createdAt.toIso8601String(),
    "is_featured": isFeatured,
    "user_id": userId,
  };
}
