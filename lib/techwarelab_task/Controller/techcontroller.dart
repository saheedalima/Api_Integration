import 'package:api_integration/service/http_service.dart';
import 'package:api_integration/techwarelab_task/Service/http_service.dart';
import 'package:get/get.dart';

class Techcontroller extends GetxController{

  var isLoadin = true.obs;
  var techlist = [].obs;

@override
  void onInit() {
  Getdatas();
    super.onInit();
  }
  void Getdatas() async{
    try{
      isLoadin(true);
      var techs =await http_service.getdatas();
      if(techs!=null){
        techlist.value=techs;
      }
    }catch(e){
      print(e);
    }finally{
      isLoadin(false);
    }
  }
}