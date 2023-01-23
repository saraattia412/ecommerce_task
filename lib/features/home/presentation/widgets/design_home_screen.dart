import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../details/presentation/viwes/details_screen.dart';
import '../../data/model/home_model.dart';

class DesignHome extends StatelessWidget {
  final int index;
  final HomeModel homeModel;
  const DesignHome({super.key, required this.index, required this.homeModel});

  @override
  Widget build(BuildContext context) {
    

    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsScreen(
                index: index, homeModel: homeModel,
              ),
            ));
      },
      child: Stack(
        alignment: AlignmentDirectional.topStart,
        children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 20.0,
            margin: const EdgeInsetsDirectional.all(8),
            child: Container(
              height: 150.h,
              width: 150.w,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage('${homeModel.allProducts[index].image}'),
              )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              // width: 70.w,
              decoration: BoxDecoration(
                  color: Colors.amberAccent.withOpacity(.8),
                  borderRadius: const BorderRadiusDirectional.only(
                      bottomEnd: Radius.circular(20),
                      topEnd: Radius.circular(20))),
              child: Row(
                children: [
                  Text(
                    'Count ',
                    style: TextStyle(fontSize: 12.sp, height: 2),
                  ),
                  Text(
                    '${homeModel.allProducts[index].rating!.count}',
                    style: TextStyle(fontSize: 12.sp, height: 2),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
