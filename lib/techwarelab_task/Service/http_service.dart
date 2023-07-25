import 'package:api_integration/service/http_service.dart';
import 'package:api_integration/techwarelab_task/Model/model.dart';
import 'package:http/http.dart'as http;
class http_service {
  
  static Future<List<Techwareapi>> getdatas()async {
     var result = await http.get(Uri.parse('http://www.mocky.io/v2/5d565297300000680030a986'));
     if(result.statusCode == 200){
       var body = result.body;
       return techwareapiFromJson(body);
     }else{
       throw Exception();
     }
  }
}