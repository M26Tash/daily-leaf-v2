import 'package:news_app/src/core/api_clients/mock_data.dart';

class NewsApiClient {
  Future<Map<String, dynamic>> fetchRawNews() async {
    await Future.delayed(
      const Duration(
        milliseconds: 500,
      ),
    );
    return MockData.newsJson;
  }
}
