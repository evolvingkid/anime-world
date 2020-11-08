import 'package:animeworld/core/configs/BaseAPIConfig.dart';
import 'package:animeworld/core/errors/httpExpections.dart';
import 'package:dio/dio.dart';

class DioAPIServices extends BaseAPIConfig {
  BaseOptions options =
      new BaseOptions(baseUrl: "http://animeworld.api.kaimly.com/");

  @override
  Future<List> getAPI({Map<String, String> addOnHeader, String url}) async {
    try {
      Dio _dio = new Dio(options);

      Response _response =
          await _dio.request(url, options: Options(method: "GET"));

      if (_response.statusCode < 200 && _response.statusCode > 226)
        throw HttpException('', _response.statusCode);

      return _response.data;
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<Map> deleteAPI(
      {Map<String, String> addOnHeader, Map body, String url, int id}) {
    // TODO: implement deleteAPI
    throw UnimplementedError();
  }

  @override
  Future<Map> patchAPI(
      {Map<String, String> addOnHeader, Map body, String url}) {
    // TODO: implement patchAPI
    throw UnimplementedError();
  }

  @override
  Future<List> postAPI(
      {Map<String, String> addOnHeader, Map body, String url}) {
    // TODO: implement postAPI
    throw UnimplementedError();
  }

  @override
  Future<Map> putAPI(
      {Map<String, String> addOnHeader, Map body, String url, int id}) {
    // TODO: implement putAPI
    throw UnimplementedError();
  }
}
