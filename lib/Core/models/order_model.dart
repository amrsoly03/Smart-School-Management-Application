import 'package:equatable/equatable.dart';

class OrderModel extends Equatable {
  final int? orderId;
  final int? orderStudent;
  final int? orderApproved;
  final int? totalPrice;

  const OrderModel({
    this.orderId,
    this.orderStudent,
    this.orderApproved,
    this.totalPrice,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        orderId: json['order_id'] as int?,
        orderStudent: json['order_student'] as int?,
        orderApproved: json['order_approved'] as int?,
        totalPrice: json['total_price'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'order_id': orderId,
        'order_student': orderStudent,
        'order_approved': orderApproved,
        'total_price': totalPrice,
      };

  @override
  List<Object?> get props => [
        orderId,
        orderStudent,
        orderApproved,
        totalPrice,
      ];
}
