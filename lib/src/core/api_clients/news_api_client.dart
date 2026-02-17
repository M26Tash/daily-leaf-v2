import 'package:daily_leaf/src/core/utils/core_logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class NewsApiClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://gnews.io/api/v4/',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  Future<List<dynamic>> fetchNews({
    required String? lang,
    required String? country,
  }) async {
    try {
      final String apiKey = dotenv.env['GNEWS_API_KEY'] ?? '';

      final response = await _dio.get(
        'top-headlines',
        queryParameters: {
          'apikey': apiKey,
          'lang': lang,
          'country': country,
          'max': 10,
        },
      );

      if (response.statusCode == 200) {
        return response.data['articles'];
      }
      return [];
    } on DioException catch (e) {
      CoreLogger.errorLog(
        'API Error',
        params: {
          'Caught': '${e.response?.statusCode}',
        },
      );

      rethrow;
    }
  }
}
