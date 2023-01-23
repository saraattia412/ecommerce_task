import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://fakestoreapi.com/',
        receiveDataWhenStatusError: true,

      ),


    );
  }


  static Future<Response> getData(
      {
        required String url,
         Map<String,dynamic>? query,
        
      })async
  {

    return await dio.get(url, queryParameters: query,);//method url && query
  }

  static Future<Response> postData(
      {
        required String url,
        Map<String, dynamic>? query,
        required Map<String, dynamic> data,
      }
      )async
      {
    return dio.post(url ,queryParameters: query,data: data);
  }


  static Future<Response> putData(
      {
        required String url,
        Map<String, dynamic>? query,
        required Map<String, dynamic> data,
        
      }
      )async
  {
    
return dio.put(url ,queryParameters: query,data: data);
  }


}