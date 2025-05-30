import 'package:flutter/widgets.dart';

import 'widgets/order_products_view_body.dart';

class OrderProductsView extends StatelessWidget {
  const OrderProductsView({super.key, required this.approvedProducts});

  final bool approvedProducts;

  @override
  Widget build(BuildContext context) {
    return  OrderProductsViewBody(approvedProducts: approvedProducts);
  }
}
