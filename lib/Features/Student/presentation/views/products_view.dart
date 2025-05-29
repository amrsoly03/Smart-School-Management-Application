import 'package:flutter/widgets.dart';
import 'package:nexura/Features/Student/presentation/views/widgets/products_view_body.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key, required this.category});
  
  final String category;

  @override
  Widget build(BuildContext context) {
    return ProductsViewBody(category: category);
  }
}
