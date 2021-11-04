import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:untitled/api/request.dart';
import 'package:untitled/globals.dart' as globals;
import 'package:untitled/provider/dogs.dart';

void mapToListUrl(Map<String, dynamic> map, context) {
  List<String> listUrls = List.empty(growable: true);
  map.forEach((key, value) {
//    print(key);
    value.isNotEmpty ? value.forEach((element) {
      getUrl(context, race: key, name: "/$element");
    }) : getUrl(context, race: key);
  });
}

void getUrl(context, {String race = "", String name = ""})  {
    final client = ApiRequest(Dio(BaseOptions(contentType: "application/json")),
        baseUrl: 'https://dog.ceo/api/');
    Future _future = client.getDogImage(race + name);
    _future.then((value) {
      globals.listUrls.add(value.message);
//      print(value.message.toString());
      // Provider.of<DOGS>(context, listen: false).allUrl = value.message.toString();
    });

}
