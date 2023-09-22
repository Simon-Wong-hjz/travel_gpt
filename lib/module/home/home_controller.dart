import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_gpt/log/log.dart';
import 'package:travel_gpt/module/history/history_controller.dart';
import 'package:travel_gpt/module/location/location_controller.dart';
import 'package:travel_gpt/obj/key.dart' as key;
import 'package:travel_gpt/obj/travel_info.dart';
import 'package:travel_gpt/route/routes.dart';

class HomeController extends GetxController {
  List<key.Key> keyList = [];

  TravelInfo travelInfo = TravelInfo();

  List<key.Key> selectKey = [];

  TextEditingController textEditingController = TextEditingController();

  FocusNode textFocusNode = FocusNode();

  @override
  void onInit() {
    super.onInit();
    _initKeyList();
    _travelInfoInit();
  }

  void _travelInfoInit() {
    travelInfo.location = "深圳";
    travelInfo.money = 2000;
    travelInfo.people = 1;
    travelInfo.goTime = formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]);
    travelInfo.backTime = formatDate(
        DateTime.now().add(const Duration(days: 1)), [yyyy, '-', mm, '-', dd]);
  }

  void _initKeyList() {
    keyList.add(key.Key("看日出", "#F67F1E"));
    keyList.add(key.Key("潜水", "#08C35C"));
    keyList.add(key.Key("密室逃脱", "#136DEB"));
    keyList.add(key.Key("爬山", "#04A4E3"));
    keyList.add(key.Key("赶海", "#752EF0"));
    keyList.add(key.Key("唱K", "#F67F1E"));
    keyList.add(key.Key("吃火锅", "#D92929"));
    keyList.add(key.Key("滑雪", "#CA12C7"));
    keyList.add(key.Key("露营", "#0FC2B6"));
    keyList.add(key.Key("吃海鲜", "#04A4E3"));
    keyList.add(key.Key("购物", "#8DB90A"));
    keyList.add(key.Key("喝奶茶", "#00359B"));
  }

  toLocation() async{
    var value = await Get.toNamed(Routes.location);
    if (value != null) {
      travelInfo.location = value;
      update(["location"]);
    }
    LocationController locationController = Get.find<LocationController>();
    locationController.initSearchHistory();
    }

    toHistory() async{
    await Get.toNamed(Routes.history);
  }

  toStrategy() async {
    if (travelInfo.location == null) {
      EasyLoading.showToast("请选择出发地");
      return;
    }
    if (travelInfo.goTime == null) {
      EasyLoading.showToast("请选择出发时间");
      return;
    }
    if (travelInfo.backTime == null) {
      EasyLoading.showToast("请选择返回时间");
      return;
    }
    if (travelInfo.people == null || travelInfo.people! <= 0) {
      EasyLoading.showToast("请输入旅行人数");
      return;
    }
    if (travelInfo.money == null || travelInfo.money! <= 0) {
      EasyLoading.showToast("请输入预算");
      return;
    }
    if (selectKey.isEmpty) {
      EasyLoading.showToast("请输入关键词");
      return;
    }
    travelInfo.keys = selectKey.map((e) => e.name).toList();
    travelInfo.createTime = formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]);
    EasyLoading.show(status: "内容生成中...", maskType: EasyLoadingMaskType.black, dismissOnTap: false);
    var body = {
      "departure": travelInfo.location,
      "startDate": travelInfo.goTime,
      "endDate": travelInfo.backTime,
      "travellerCount": travelInfo.people,
      "budget": travelInfo.money,
      "keywords": travelInfo.keys
    };
    var request = http.Request('POST', Uri.parse('https://travelgpt.azurewebsites.net/generatePlan?isWeb=false'));
    request.body = jsonEncode(body);
    var headers = {
      'Content-Type': 'application/json'
    };
    request.headers.addAll(headers);
    late http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (e) {
      Log.e(e);
      EasyLoading.showError("发送失败，再试一次吧");
      return;
    }
    Log.i(response.statusCode);
    EasyLoading.dismiss();
    var responseBody = await response.stream.bytesToString();
    Log.i(responseBody);
    if (response.statusCode == 200) {
      try {
        travelInfo.travelDestination = TravelDestination.fromJson(jsonDecode(responseBody));
      } catch(e) {
        Log.e(e);
        EasyLoading.showError("解析失败，再试一次吧");
        return;
      }
    } else {
      EasyLoading.showError("请求失败，再试一次吧");
      return;
    }
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var values = prefs.getStringList("travelInfoList");
    if (values != null) {
      values.insert(0, jsonEncode(travelInfo.toJson()));
      prefs.setStringList("travelInfoList", values);
    } else {
      prefs.setStringList("travelInfoList", [jsonEncode(travelInfo.toJson())]);
    }
    selectKey.clear();
    update(["keyInput"]);
    Get.toNamed(Routes.travel, arguments: travelInfo);
  }

  void showDatePicker() {
    showDateRangePicker(
      context: Get.context!,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
      locale: const Locale("zh", "CN"),
      initialDateRange: DateTimeRange(
        start: DateTime.parse(travelInfo.goTime!),
        end: DateTime.parse(travelInfo.backTime!),
      ),
    ).then((value) {
      if (value != null) {
        travelInfo.goTime = formatDate(value.start, [yyyy, '-', mm, '-', dd]);
        travelInfo.backTime = formatDate(value.end, [yyyy, '-', mm, '-', dd]);
        update(["time"]);
      }
    });
  }

  void changePeople(int i) {
    if (travelInfo.people! + i >= 0) {
      travelInfo.people = travelInfo.people! + i;
      update(["people"]);
    }
  }

  void changeMoney(int i) {
    if (travelInfo.money! + i >= 0) {
      travelInfo.money = travelInfo.money! + i;
      update(["money"]);
    }
  }

  void addKey(String value) {
    if (selectKey.length >= 10) {
      EasyLoading.showToast("最多添加10个标签");
      return;
    }
    var val = keyList.firstWhereOrNull((element) => element.name == value);
    if (val != null) {
      selectKey.add(val);
    } else {
      selectKey.add(key.Key(value, "#2F3337"));
    }
    textEditingController.text = "";
    update(["keyInput"]);
    textFocusNode.requestFocus();
  }

  void removeKey(key.Key e) {
    selectKey.removeWhere((element) => element.name == e.name);
    update(["keyInput"]);
  }
}
