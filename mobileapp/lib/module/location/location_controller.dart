import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_gpt/log/log.dart';
import 'package:travel_gpt/util/hex_to_color.dart';

class LocationController extends GetxController {

  List<String> searchHistory = [];
  List<String> hotCity = ["北京", "上海", "广州", "深圳", "郑州", "长沙", "武汉", "杭州", "南京"];

  TextEditingController textEditingController = TextEditingController();

  bool isSearch = false;

  List<String> cityList = [];

  List<String> searchCityList = [];

  @override
  void onInit() async{
    super.onInit();
    await _initCityList();
    await initSearchHistory();
  }

  @override
  onReady() {
    textEditingController.addListener(() {
      search(textEditingController.text);
    });
  }

  _initCityList() async{
    //加载城市列表
    var value = await rootBundle.loadString('assets/data/china.json');
    cityList.clear();
    Map countyMap = json.decode(value);
    List list = countyMap['china'];
    for (var v in list) {
      cityList.add(v['name']);
    }
  }

  void search(String value) {
    if (value.trim().isEmpty) {
      isSearch = false;
      searchCityList.clear();
    } else {
      searchCityList.clear();
      isSearch = true;
      var temp = cityList.where((element) => element.contains(value.trim()));
      if (temp.isNotEmpty) {
        searchCityList.addAll(temp);
      }
    }
    update(["main"]);
  }

  Widget text(String search) {
    var value = textEditingController.text.trim();
    var index = search.indexOf(value);
    return RichText(
      text: TextSpan(
        text: search.substring(0, index),
        style: const TextStyle(
          color: Colors.black,
          fontSize: 14,
        ),
        children: [
          TextSpan(
            text: search.substring(index, value.length + index),
            style: TextStyle(
              color: hexToColor("#CD128A"),
              fontSize: 14,
            ),
          ),
          TextSpan(
            text: search.substring(value.length + index),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  initSearchHistory() async{
    searchHistory.clear();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var value = prefs.getStringList("searchHistory");
    if (value != null && value.isNotEmpty) {
      searchHistory.addAll(value);
    }
    update(["main"]);
  }

   back(String value) async{
     if (!searchHistory.contains(value)) {
       searchHistory.insert(0, value);
     }
     await _saveHistory();
     Get.back(result: value);
   }

   _saveHistory() async{
     isSearch = false;
     if (searchHistory.length > 5) {
       searchHistory = searchHistory.getRange(0, 5).toList();
     }
     final SharedPreferences prefs = await SharedPreferences.getInstance();
     prefs.setStringList("searchHistory", searchHistory);
   }

}