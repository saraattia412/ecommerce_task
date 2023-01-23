import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../home/data/model/home_model.dart';
import '../../../home/presentation/cubit/home_cubit.dart';
import '../widgets/design_details.dart';

class DetailsScreen extends StatelessWidget {
  final int index;
  final HomeModel homeModel;
  const DetailsScreen(
      {super.key, required this.index, required this.homeModel});

  @override
  Widget build(BuildContext context) {


    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsetsDirectional.only(top: 5.h, start: 5.w
            ),
            child: Stack(
              children: <Widget>[
                SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.popAndPushNamed(context, '/home');
                          },
                          icon: const Icon(Icons.arrow_back_ios_new_outlined),
                        ),
                        DesignDetails(
                          homeModel: homeModel,
                          index: index,
                        )
                      ]),
                ),

              ],
            ),
          ),
        );
      },
    );
  }
}
