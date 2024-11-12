
import 'package:dio/dio.dart';


class DioHelper
{
  static Dio? dio;
  //String lang = CacheHelper.getData(key: 'lang') ?? window.locale;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsdata.io/api/1/',
        receiveDataWhenStatusError: true,
        // headers: {
        //   'Content-Type': 'application/json',
        // },
      ),
    );
  }

  static Future<Response?> getData({
    required String url,
    required Map<String, dynamic> query,
  }) async {

      return await dio?.get(url, queryParameters: query);
  }

  static Future<Response?> postData({
    required String url,
    Map<String,dynamic>? query,
    required Map<String,dynamic> data,
    String lang ='en',
    String? token,
})async
  {

    dio?.options.headers={
      'lang':lang,
      'content-type':'application/json',
      'authorization':token??'',

    };
    return dio?.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response?> putData({
    required String url,
    Map<String,dynamic>? query,
    required Map<String,dynamic> data,
    String lang ='en',
    String? token,
  })async
  {

    dio?.options.headers={
      'lang':lang,
      'content-type':'application/json',
      'authorization':token??'',

    };
    return dio?.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}