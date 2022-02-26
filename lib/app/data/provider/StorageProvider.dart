import 'package:get_storage/get_storage.dart';

final box = GetStorage();
final symptomsBox = GetStorage('symptoms');
final existingillnessBox = GetStorage('existingillness');

void restore(List storagename ,List varrbelname  ){

  for (var i=0; i< storagename.length; i++ ){
    for(var j=0; j< storagename.length; j++) {
      if (storagename[i]['id'] == varrbelname[j]['id']){
        varrbelname[j]['selected'] = 'true';

      }
    }
  }
  return;
}