import 'package:api_integration/Api%20integratiin%20using%20Dio/Controller/Home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class details extends StatelessWidget {
  int index;
  details({required this.index});
  HomeCntroller controller = Get.find<HomeCntroller>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(controller.post[index].id.toString()),
            Text(controller.post[index].title),
            Text(controller.post[index].body),
          ],
        ),
      ),
    );
  }
}
