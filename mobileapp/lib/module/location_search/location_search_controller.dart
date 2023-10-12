import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LocationSearchController extends GetxController {

  List<String> cityList = [];

  @override
  void onInit() async{
    super.onInit();
    await loadData();
  }


  loadData() async {
    //加载城市列表
    var value = await rootBundle.loadString('assets/data/china.json');
    cityList.clear();
    Map countyMap = json.decode(value);
    List list = countyMap['china'];
    for (var v in list) {
      cityList.add(v['name']);
    }
  }
}