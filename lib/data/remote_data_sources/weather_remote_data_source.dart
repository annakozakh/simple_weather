import 'package:dio/dio.dart';

class WeatherRemoteDataSource {
  Future<Map<String, dynamic>?> getWeatherModel({
    required String city,
  }) async {
    try {
      final response = await Dio().get<Map<String, dynamic>>(
          'http://api.weatherapi.com/v1/current.json?key=6b138f21c1644761a26144818232404&q=$city&aqi=no');
      return response.data;
    } on DioError catch (error) {
      throw Exception(error.response?.data ?? '');
    }
  }
}
