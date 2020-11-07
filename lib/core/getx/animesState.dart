import 'package:animeworld/core/services/animeworldservices.dart';
import 'package:animeworld/core/services/dependencyInjection.dart';
import 'package:get/get.dart';

class AnimeState extends GetxController {
  DioAPIServices _dioAPIServices = locator<DioAPIServices>();

  @override
  void onInit() {
    fetchDataFromServers();
    super.onInit();
  }

  Future<void> fetchDataFromServers() async {
    final _fetchdata =
        await _dioAPIServices.getAPI(url: 'api/anime_movies/list');
    print(_fetchdata);
  }
}
