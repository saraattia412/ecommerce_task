// ignore_for_file: avoid_print
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/network/end_points.dart';
import '../../../../data/network/remote.dart';
import '../../data/model/home_model.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  HomeModel? homeModel;
  void getHomeData() {
    emit(HomeLoadingGetAllProduct());
    DioHelper.getData(
      url: products,
    ).then((value) {
      homeModel = HomeModel.fromjson(value.data);
      print('success get data');
      emit(HomeSuccessGetAllProduct());
    }).catchError((error) {
      print(error.toString());
      emit(HomeErrorGetAllProduct());
    });
  }
}
