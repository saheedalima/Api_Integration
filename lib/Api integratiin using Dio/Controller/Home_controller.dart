import 'package:api_integration/Api%20integratiin%20using%20Dio/Service/dio_service.dart';
import 'package:api_integration/Api%20integratiin%20using%20Dio/model/post_mdel.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomeCntroller extends GetxController {
  //Rxbool,RxList means observable data
  ///RXist - for storing list from API.and Rxlist means this is observable
  ///postmodel ennula modelclass vazhiyulla data edukkan
  RxList <PostModel> post = RxList(); //for observable
  RxBool isLoading = true.obs;
  RxBool isListViewScrollDown = false.obs;   //to check the list shows the last values(scroll down)
  RxBool isInternetConnection = true.obs;

  var url = "https://jsonplaceholder.typicode.com/posts";
  var itemController = ItemScrollController(); //dependency

  //for check internet
  isInternetconnected() async {
    isInternetConnection.value = await InternetConnectionChecker().hasConnection;
  }

  ///calling api an getting responce
  getposts () async {
    isInternetconnected();
    isLoading.value = true;
    var responce = await DioServiece().getMethod(url); // calling function rom service class
    //for checking condition is that success
    if(responce.statusCode == 200){
      responce.data.forEach((element){
        post.add(PostModel.fromJson(element));
      });
      isLoading.value = false;
    }
  }

  //scroll listview to up
  ScrolltoDown(){
    itemController.scrollTo(index: post.length-8, duration: Duration(seconds: 3),  //optinal
    curve: Curves.bounceIn);        //optional
    isListViewScrollDown.value = true;
  }

//scroll listview to up
  ScrollUp(){
    itemController.scrollTo(index: 0, duration: Duration(seconds: 3),
        curve: Curves.easeInCubic);
    isListViewScrollDown.value = false;
  }
  @override
  void onInit() {
    getposts();
    isInternetconnected();
    super.onInit();
  }
}
///in thi code,
///whole data getting from api is in responce.if responce is success,taking datas one by one in responce
///and adding it in our list.