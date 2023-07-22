import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wallpaper_app/modal/apimodal_class.dart';

class ApiHelpers {
  ApiHelpers._();

  static final ApiHelpers apiHelpers = ApiHelpers._();

  String api = "https://jsonplaceholder.typicode.com/posts";

  Future<List?> getWallpaperResponse({String query = 'nature'}) async {
    String wallpaperApi =
        "https://pixabay.com/api/?key=38361717-7f57559853bd177493580bd2c&orientation=vertical&safesearch=true&q=$query";
    http.Response response = await http.get(Uri.parse(wallpaperApi));

    if (response.statusCode == 200) {
      var wallpaper = jsonDecode(response.body);

      List allWall = wallpaper['hits'];

      return allWall;
    }
  }

  Future<Posts?> getSingleResponse() async {
    http.Response response = await http.get(Uri.parse(api));

    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      Posts allData = Posts.fromMap(data: data);

      return allData;
    }
  }

  // Future<List<ApiModalClass>?> getMultipleResponse() async {
  //   http.Response response = await http.get(Uri.parse(api));
  //
  //   if (response.statusCode == 200) {
  //     List data = jsonDecode(response.body);
  //     List<ApiModalClass> posts =
  //         data.map((e) => ApiModalClass.fromMap(data: e)).toList();
  //     return posts;
  //   }
  // }
}
