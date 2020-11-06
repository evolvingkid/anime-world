abstract class BaseAPIConfig {
  Future<List> getAPI({Map<String, String> addOnHeader, String url});

  Future<List> postAPI({Map<String, String> addOnHeader, Map body, String url});

  Future<Map> patchAPI({Map<String, String> addOnHeader, Map body, String url});

  Future<Map> putAPI(
      {Map<String, String> addOnHeader, Map body, String url, int id});

  Future<Map> deleteAPI(
      {Map<String, String> addOnHeader, Map body, String url, int id});
}
