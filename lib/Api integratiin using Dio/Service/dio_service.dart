import 'package:dio/dio.dart';

class DioServiece {
  //to fetch responce from
  ///Getting values from API.
  Future<dynamic> getMethod(String url) async {  //ee function evide vilikkunno avide ee url pass cheyyum ennitt athine prcess cheyth api nn responce edukkum

    Dio dio = Dio();
    return await dio.get(url,options: Options(responseType: ResponseType.json,method: 'GET')). //after url,in options responce type and that is optional
    then((responce) {   //then - because of this is future opertaion
      return responce;
    });
  }
}