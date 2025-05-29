import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nexura/Core/utils/app_router.dart';
import 'package:nexura/Core/utils/size_config.dart';
import 'package:nexura/Core/utils/styles.dart';
import 'package:nexura/Core/utils/theme.dart';
import 'package:nexura/Core/widgets/custom_appBar.dart';
import 'package:nexura/Core/widgets/custom_snackbar.dart';
import 'package:nexura/Features/Admin/presentation/manager/models_cubit/models_cubit.dart';
import 'package:nexura/Features/Student/presentation/manager/student_cubit/student_cubit.dart';
import 'package:nexura/Features/Student/presentation/views/widgets/cart_product_card.dart';

import '../../../../../Core/widgets/custom_button.dart';

class ShoppingCartViewBody extends StatelessWidget {
  const ShoppingCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    ModelsCubit modelsCubit = BlocProvider.of<ModelsCubit>(context);
    StudentCubit studentCubit = BlocProvider.of<StudentCubit>(context);

    return Scaffold(
      appBar: const CustomAppBar(title: 'Shopping Cart'),
      body: modelsCubit.shoppingCart.isEmpty
          ? Center(
              child: Text(
                'Your cart is empty',
                style: Styles.textStyle20.copyWith(color: darkBlue),
              ),
            )
          : SingleChildScrollView(
              child: BlocConsumer<ModelsCubit, ModelsState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is ShoppingCartUpdated) {
                    return Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.shoppingCart.length,
                          itemBuilder: (context, index) {
                            return CartProductCard(
                              productModel: state.shoppingCart[index],
                              index: index,
                            );
                          },
                        ),
                        BlocConsumer<StudentCubit, StudentState>(
                          listener: (context, state) {
                            if (state is AddOrderSuccess) {
                              kShowSnackBar(
                                  context, 'Order sent to your parent');
                              studentCubit
                                  .addOrderProducts(
                                op_order: state.order.orderId.toString(),
                                products: modelsCubit.shoppingCart,
                              )
                                  .then(
                                (val) {
                                  modelsCubit.resetShoppingCart();
                                  GoRouter.of(context).pushReplacement(
                                      AppRouter.kCafeteriaView);
                                },
                                onError: (_) {},
                              );
                            } else if (state is StudentFailure) {
                              kShowSnackBar(context, state.errMessage);
                            }
                          },
                          builder: (context, state) {
                            if (state is StudentLoading) {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: darkBlue,
                                ),
                              );
                            } else {
                              return Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    CustomButton(
                                      title: 'Checkout',
                                      function: () {
                                        if (modelsCubit.shoppingCart.isEmpty) {
                                          return kShowSnackBar(
                                            context,
                                            'Cart is empty',
                                          );
                                        }
                                        studentCubit.addOrder();
                                      },
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight * 0.1,
                        ),
                      ],
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: darkBlue,
                      ),
                    );
                  }
                },
              ),
            ),
    );
  }
}
