import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/home_cubit.dart';
import '../widgets/design_home_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Cart',
            ),
          ),
          body: ConditionalBuilder(
            condition: HomeCubit.get(context).homeModel != null,
            builder: (BuildContext context) => SingleChildScrollView(
              child: Column(
                children: [
                  
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 1.0,
                    children: List.generate(
                        HomeCubit.get(context).homeModel!.allProducts.length,
                        (index) => DesignHome(
                              index: index,
                              homeModel: HomeCubit.get(context).homeModel!,
                            )),
                  ),
                ],
              ),
            ),
            fallback: (BuildContext context) =>
                const Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}
