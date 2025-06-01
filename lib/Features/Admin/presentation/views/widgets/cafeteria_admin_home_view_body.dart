import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nexura/Core/widgets/home_appbar.dart';
import 'package:nexura/Features/Admin/presentation/manager/admin_cubit/admin_cubit.dart';

import '../../../../../Core/utils/app_router.dart';
import '../../../../Parent/presentation/views/widgets/custom_rounded_button.dart';

class CafeteriaAdminHomeViewBody extends StatelessWidget {
  const CafeteriaAdminHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    AdminCubit adminCubit = BlocProvider.of<AdminCubit>(context);
    return Scaffold(
      appBar: const HomeAppbar(title: 'Cafeteria Admin Home'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomRoundedButton(
              text: "Add Product",
              icon: Icons.add_circle_outline,
              onTap: () {
                GoRouter.of(context).push(AppRouter.kAddProductView);
              },
            ),
            const SizedBox(height: 40),
            CustomRoundedButton(
              text: "View Previous Orders",
              icon: Icons.history,
              onTap: () {
                adminCubit.viewAllOrders();
                GoRouter.of(context).push(AppRouter.kAllOrdersView);
              },
            ),
          ],
        ),
      ),
    );
  }
}
