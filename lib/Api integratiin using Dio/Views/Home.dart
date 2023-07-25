
import 'package:api_integration/Api%20integratiin%20using%20Dio/Controller/Home_controller.dart';
import 'package:api_integration/Api%20integratiin%20using%20Dio/Views/details.dart';
import 'package:api_integration/Api%20integratiin%20using%20Dio/utils/colors.dart';
import 'package:api_integration/Api%20integratiin%20using%20Dio/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:lottie/lottie.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

void main(){
  runApp(GetMaterialApp(home: Home(),));
}

class Home extends StatelessWidget {

  HomeCntroller controller = Get.put(HomeCntroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Obx(()=>controller.isInternetConnection.value ? _buildFab() : Container()),
      backgroundColor: MyColors.bgColor,
      ///complete body observable
      body: Obx(()=>SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: controller.isInternetConnection.value ?
        (controller.isLoading.value ?
        loadAnim() : getData()) : noInternet(context),
      )),
    );
  }

 Center  loadAnim() {
    return Center(
      child: SizedBox(
        width: 150,
        height: 150,
        child: Lottie.asset("assets/a.json"),
      ),
    );
  }

 RefreshIndicator getData() {
    return RefreshIndicator(
        child: ScrollablePositionedList.builder(
          itemScrollController: controller.itemController, //fetch the position
            physics: BouncingScrollPhysics(),  //animation for list
            itemCount: controller.post.length,   //length of data from controller
            itemBuilder: (context,index){
              return InkWell(onTap: (){
                Get.to(details(index: index,));
              },
                child: Card(
                  child: ListTile(
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(controller.post[index].id.toString()),  //id from the list named post
                      ),
                    ),
                    title: Text(controller.post[index].title,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                    subtitle: Text(controller.post[index].body),
                  ),
                ),
              );
            }),
        onRefresh: (){
          return controller.getposts();
        });
 }

 Center noInternet(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Lottie.asset("assets/b.json"),
          ),
          MaterialButton(onPressed: ()=>tryAgain(context),
          child: Text("Try Again"),)
        ],
      ),
    );
 }
 void tryAgain(BuildContext context) async{
   if(await InternetConnectionChecker().hasConnection==true){
   controller.getposts();
   }else{
   showCustomSnackBar(context);
   }
 }

 FloatingActionButton _buildFab() {
    return FloatingActionButton(onPressed: (){
      controller.isListViewScrollDown.value ?
      controller.ScrollUp() :
      controller.ScrolltoDown();
    },
    child: controller.isListViewScrollDown.value ? Icon(Icons.arrow_upward) : Icon(Icons.arrow_downward),);
  }
}
