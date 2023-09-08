import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_gpt/obj/travel_info.dart';

class HistoryController extends GetxController {
  List<TravelInfo> travelInfoList = [];

  initList() async{
    travelInfoList.clear();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var values = prefs.getStringList("travelInfoList");
    if (values != null) {
      for (var value in values) {
        travelInfoList.add(TravelInfo.fromJson(jsonDecode(value)));
      }
    }
    update(["history"]);
  }
}
