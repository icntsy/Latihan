import 'package:get/get.dart';

class ArticleProvider extends GetConnect {
  String url = 'http://192.168.34.95:8000/api/article';
  
  Future<Response> getAll() => get(url);

  Future<Response> create(Map data) => post(url, data);

  Future<Response> update(Map data) => put(url, data);

  Future<Response> deleteArticle(Map data) => post(url + '/delete', data);


}