import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:new_version/new_version.dart';

class MainController extends GetxController {
  //TODO: Implement MainController

@override
  void onInit() async{
    final newVersion = NewVersion(iOSId: "com.bookhub.bookhub", androidId: "com.bookhub.bookhub");
    newVersion.showAlertIfNecessary(context: Get.context!);

    final status = await newVersion.getVersionStatus();
    if(status!= null){
      newVersion.showUpdateDialog(context: Get.context!, 
      versionStatus: status,
      dialogTitle: "Update Available!".tr,
      dialogText: "Update the app to continue because we added great features to the app 🤩".tr,
      allowDismissal: false,  
      updateButtonText: "Update",
      );
    }
    // TODO: implement onInit


    super.onInit();
  }

 BottomMenu _bottomMenu = BottomMenu.home;
  void setMenu(BottomMenu menu) {
    _bottomMenu = menu;
    update();
  }

  BottomMenu get bottomMenu => _bottomMenu;
}
enum BottomMenu { home, saved,  categories }
