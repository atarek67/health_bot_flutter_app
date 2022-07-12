import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../components/constants/constants.dart';

class RecommendedMeals{
  late Dio dio;

  RecommendedMeals(){
    BaseOptions options = BaseOptions(
      followRedirects: false,
      validateStatus: (status) => true,
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 15 * 1000, //15 Seconds
      receiveTimeout: 15 * 1000, //15 Seconds
    );
    dio = Dio(options);
  }
  Future<List<dynamic>> getLoseMeals() async {
    try {
      Response response = await dio.get('lose');
      if (kDebugMode) {
        print(response.data.toString());
      }
      return response.data;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return [];
    }
  }

  Future<List<dynamic>> getHealthyMeals() async {
    try {
      Response response = await dio.get('healthy');
      if (kDebugMode) {
        print(response.data.toString());
      }
      return response.data;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return [];
    }
  }

  Future<List<dynamic>> getGainMeals() async {
    try {
      Response response = await dio.get('gain');
      if (kDebugMode) {
        print(response.data.toString());
      }
      return response.data;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return [];
    }
  }
}