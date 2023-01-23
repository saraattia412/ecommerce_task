import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sizer/sizer.dart';
// ignore: depend_on_referenced_packages

import '../../../home/data/model/home_model.dart';

class DesignDetails extends StatelessWidget {
  final int index;
  final HomeModel homeModel;
  const DesignDetails(
      {super.key, required this.index, required this.homeModel});

  @override
  Widget build(BuildContext context) {
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${homeModel.allProducts[index].title}',
          style: TextStyle(fontSize: 15.sp),
        ),
        Stack(
          alignment: AlignmentDirectional.topStart,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          '${homeModel.allProducts[index].image}'))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 30.w,
                decoration: BoxDecoration(
                    color: Colors.green.withOpacity(.8),
                    borderRadius: const BorderRadiusDirectional.only(
                        bottomEnd: Radius.circular(20),
                        topEnd: Radius.circular(20))),
                child: Text(
                  '\$${homeModel.allProducts[index].price}',
                  style: TextStyle(fontSize: 12.sp, height: 2),
                ),
              ),
            ),
          ],
        ),
        Text(
          '${homeModel.allProducts[index].description}',
          style: const TextStyle(height: 1.5),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 30,
        ),
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: Colors.amberAccent,
          margin: EdgeInsetsDirectional.all(5.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Rate',
                style: TextStyle(height: 1.5, fontSize: 20.sp),
              ),
              const Icon(Icons.star_rate_outlined),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: CircularPercentIndicator(
                    radius: 30,
                    lineWidth: 7,
                    percent:
                        (homeModel.allProducts[index].rating!.rate! * 10) / 100,
                    center: Text(
                      '${homeModel.allProducts[index].rating!.rate}',
                      style: const TextStyle(overflow: TextOverflow.fade),
                    ),
                    progressColor: Colors.greenAccent,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
