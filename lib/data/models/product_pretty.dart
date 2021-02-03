// To parse this JSON data, do
//
//     final productPretty = productPrettyFromJson(jsonString);

import 'dart:convert';

ProductPretty productPrettyFromJson(String str) =>
    ProductPretty.fromJson(json.decode(str));

String productPrettyToJson(ProductPretty data) => json.encode(data.toJson());

class ProductPretty {
  ProductPretty({
    this.categoryName,
    this.menuCategoryId,
    this.photo,
    this.photoOrigin,
    this.price,
    this.productId,
    this.productName,
    this.productProductionDescription,
  });

  String categoryName;
  String menuCategoryId;
  String photo;
  String photoOrigin;
  double price;
  String productId;
  String productName;
  String productProductionDescription;

  factory ProductPretty.fromJson(Map<String, dynamic> json) => ProductPretty(
        categoryName:
            json['category_name'] == null ? null : json['category_name'],
        menuCategoryId:
            json['menu_category_id'] == null ? null : json['menu_category_id'],
        photo: json['photo'] == null ? null : json['photo'],
        photoOrigin: json['photo_origin'] == null ? null : json['photo_origin'],
        price: json['price'] == null ? null : json['price'],
        productId: json['product_id'] == null ? null : json['product_id'],
        productName: json['product_name'] == null ? null : json['product_name'],
        productProductionDescription:
            json['product_production_description'] == null
                ? null
                : json['product_production_description'],
      );

  Map<String, dynamic> toJson() => {
        'category_name': categoryName == null ? null : categoryName,
        'menu_category_id': menuCategoryId == null ? null : menuCategoryId,
        'photo': photo == null ? null : photo,
        'photo_origin': photoOrigin == null ? null : photoOrigin,
        'price': price == null ? null : price,
        'product_id': productId == null ? null : productId,
        'product_name': productName == null ? null : productName,
        'product_production_description': productProductionDescription == null
            ? null
            : productProductionDescription,
      };
}
