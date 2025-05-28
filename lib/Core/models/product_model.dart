import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final int? productId;
  final String? productName;
  final String? productCategory;
  final int? productPrice;
  final String? productImage;

  const ProductModel({
    this.productId,
    this.productName,
    this.productCategory,
    this.productPrice,
    this.productImage,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        productId: json['product_id'] as int?,
        productName: json['product_name'] as String?,
        productCategory: json['product_category'] as String?,
        productPrice: json['product_price'] as int?,
        productImage: json['product_image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'product_id': productId,
        'product_name': productName,
        'product_category': productCategory,
        'product_price': productPrice,
        'product_image': productImage,
      };

  @override
  List<Object?> get props {
    return [
      productId,
      productName,
      productCategory,
      productPrice,
      productImage,
    ];
  }
}
