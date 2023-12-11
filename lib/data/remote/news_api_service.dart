import 'package:newz/models/article_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<ArticleModel> getApi() async {
  final response = await http.get(Uri.parse(
      'https://saurav.tech/NewsAPI/top-headlines/category/technology/us.json'));
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    return ArticleModel.fromJson(data);
  } else {
    return ArticleModel.fromJson(data);
  }
}
