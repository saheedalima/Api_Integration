import 'package:api_integration/techwarelab_task/Model/model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class techwidget extends StatelessWidget {

 final Techwareapi techwareapi;
 techwidget(this.techwareapi);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          techwareapi.profileImage!,
        ),
      ) ,
      title: Text(techwareapi.name!),
      subtitle: Text(techwareapi.email!),
    );
  }
}
