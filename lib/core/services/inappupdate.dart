import 'package:in_app_update/in_app_update.dart';

class InAppupdateServices {

  Future<void> checkForUpdate() async {
    InAppUpdate.checkForUpdate().then((info) {
      // * start background update
      if (info.updateAvailable) {
        InAppUpdate.startFlexibleUpdate().then((_) {
          // *install update
          InAppUpdate.completeFlexibleUpdate().then((_) {});
        });
      }
    });
  }
}
