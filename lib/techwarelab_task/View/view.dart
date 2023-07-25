import 'package:api_integration/techwarelab_task/Controller/techcontroller.dart';
import 'package:api_integration/techwarelab_task/Model/model.dart';
import 'package:api_integration/techwarelab_task/View/widget/techwidget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

void main(){
  runApp(DevicePreview(enabled: !kReleaseMode,
    builder: (context) => GetMaterialApp(
      useInheritedMediaQuery: true, home: ViewEx(),
    ), // Wrap your app
  ),);
}
class ViewEx extends StatelessWidget {

  Techcontroller techcontroller = Get.put(Techcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Student Details"),),
      body: ListView.builder(
       // shrinkWrap: true,
        itemCount: techcontroller.techlist.length,
          itemBuilder: (context,index){
            return techwidget(techcontroller.techlist[index]);
          }),
    );
  }
}
