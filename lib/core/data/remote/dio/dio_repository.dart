import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:task_flutter_rwid/env.dart';

import '../../../helpers/encryption_helper.dart';
import '../../entity/news_dio_model.dart';
import '../../../helpers/dio_helper.dart';

class DioRepository {
  final int _pageSize = 5;
  final apiKeyNews = EncryptionHelpers.decrypt(Env.apiKey);
  // final apiKeyNews = '1b24593390244df9b895aa1df23cd1f6';
  final dioHelper =
      DioHelper(baseUrl: 'https://newsapi.org/v2/top-headlines?country=us');

  Future<List<NewsDioModel>> getNews(
      {required String selectedCategories, required int page}) async {
    try {
      final response = await dioHelper.dio.get('&category=$selectedCategories',
          queryParameters: {
            'pageSize': _pageSize,
            'page': page,
            'apiKey': apiKeyNews
          });
      if (response.statusCode == 200) {
        final List listNews = response.data["articles"] ?? [];
        return listNews.map((news) => NewsDioModel.fromMap(news)).toList();
      } else {
        throw Exception('Failed with status code: ${response.statusCode}');
      }
    } on DioException catch (e) {
      log('Dio Error: ${e.message}');
      throw Exception('Failed to fetch news: ${e.message}');
    } catch (e) {
      log('Unexpected error: $e');
      throw Exception('Unexpected error');
    }
  }
}
