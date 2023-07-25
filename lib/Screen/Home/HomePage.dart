import 'package:api_integration/api%20integration%20using%20http/Controller/ProductController.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import 'Widget/ProductTile.dart';

void main(){
  runApp(DevicePreview(enabled: !kReleaseMode,
    builder: (context) => GetMaterialApp(
      useInheritedMediaQuery: true, home: HomeApi(),
    ), // Wrap your app
  ),);
}

class HomeApi extends StatelessWidget{
//object of GetX
  ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Page"),),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: const [
                Expanded(
                  child: Text(
                    "ShopMe",
                    style: TextStyle(
                        fontFamily: "avenir",
                        fontSize: 32,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(
                  () {
                if (productController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    itemCount: productController.productlist.length,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    itemBuilder: (context, index) {
                      return ProductTile(productController.productlist[index]);
                    },
                    staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                  );
                }
              },
            ),
          ),
        ],
      ),


    );
  }
}
      // body: Column(
      //   children: [
      //     Padding(padding: EdgeInsets.all(15),
      //     child: Row(
      //       children: [
      //         //take gridview remaining space
      //         Expanded(
      //             child: Text("Shop Me!!",style: TextStyle(fontSize: 30),)),
      //
      //       ],
      //     ),),
      //     Expanded(child: Obx(() {
      //       if(productController.isLoading.value){
      //         return Center(
      //           child: CircularProgressIndicator(),
      //         );
      //       }else{
      //         return GridView.builder(
      //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //                 crossAxisCount: 2,
      //                 mainAxisSpacing: 15,
      //                 crossAxisSpacing: 15),
      //             itemCount: productController.productlist.length,
      //             itemBuilder: (context,index){
      //               //
      //               return ProductTile(productController.productlist[index]);
      //             });
      //       }
      //     }))
      //   ],
      // ),
