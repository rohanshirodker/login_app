import 'package:cyanodoc_test/app/data/provider/StorageProvider.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ExistingIllnessProvider extends GetxController {

  final List<Map<String, dynamic>> existingillness = [
    {"id": '1', "name": "Hypothyroid", "selected": "false"},
    {"id": '2', "name": "Recent pregnancy/abortion within one year", "selected": "false"},
    {"id": '3', "name": "Neck swelling for many years (Goitre)", "selected": "false"},
    {"id": '4', "name": "Tuberculosis", "selected": "false"},
    {"id": '5', "name": "Epilepsy", "selected": "false"},
    {"id": '6', "name": "Thalassemia", "selected": "false"},
  ].obs;

  @override
  void onInit() {
    try{List existingillnesslist = (existingillnessBox .read('existingillness'));
    restore( existingillnesslist, existingillness   );
    print('restored illesess');
  }catch(e){
      print(e);
    }
    super.onInit();
  }
}
