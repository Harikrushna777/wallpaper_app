import 'package:flutter/cupertino.dart';
import '../modal/apimodal_class.dart';
import 'helpers/api_helpers.dart';

class ApiController extends ChangeNotifier {
  Posts? post;
  List data = [];
  ApiController() {
    search();
  }
  Future<void> getData() async {
    post = await ApiHelpers.apiHelpers.getSingleResponse();
  }

  search({String val = "nature"}) async {
    data = await ApiHelpers.apiHelpers.getWallpaperResponse(query: val) ?? [];
    notifyListeners();
    return 0;
  }
}
