import 'package:dio/dio.dart';
import 'package:example1/models/NewsResponse.dart';

class NewsApiServices {
  static String _apiKey = "cbb8da24616c47ffb9af93e6282b02b5";
  final String _url =
      "https://newsapi.org/v2/everything?q=tesla&from=2021-11-17&sortBy=publishedAt&apiKey=$_apiKey";

  late Dio _dio;

  NewsApiServices() {
    _dio = Dio();
  }

  Future fetchNewsArticle() async {
    try {
      Response response = await _dio.get(_url);
      NewsResponse newsResponse = NewsResponse.fromJson(response.data);
      return newsResponse.articles;
    } on DioError catch (e) {
      print(e);
    }
  }
}
