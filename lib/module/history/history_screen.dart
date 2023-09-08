import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:travel_gpt/obj/travel_info.dart';
import 'package:travel_gpt/route/routes.dart';
import 'package:travel_gpt/util/hex_to_color.dart';

import 'history_controller.dart';

class HistoryScreen extends GetView<HistoryController> {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.initList();
    return Scaffold(
      backgroundColor: hexToColor("#F5F5F5"),
      appBar: AppBar(
        backgroundColor: hexToColor("#F5F5F5"),
        elevation: 0,
        leadingWidth: 100,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Row(
          children: [
            const SizedBox(width: 15,),
            Image.asset("assets/返回.png", color: Colors.black, height: 16.h,),
            Text("返回", style: TextStyle(fontSize: 12.sp, color: Colors.black),),
          ],
        ),
        ),
        title: Text("历史记录", style: TextStyle(fontSize: 18.sp, color: Colors.black, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: GetBuilder<HistoryController>(
        id: "history",
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10,),
                if (controller.travelInfoList.isNotEmpty)
                ...controller.travelInfoList.map((e) => _buildTravelInfo(e)).toList(),
                const SizedBox(height: 10,),
              ],
            ),
          );
        },
      ),
    );
  }

  _buildTravelInfo(TravelInfo e) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(left: 15.h, right: 15.h, bottom: 10.h),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(e.location!, style: TextStyle(fontSize: 16.sp, color: Colors.black, fontWeight: FontWeight.bold),),
                Image.asset("assets/详情.png", color: Colors.black, height: 16.h,),
              ],
            ),
            const SizedBox(height: 5,),
            Text(e.createTime!, style: TextStyle(fontSize: 12.sp, color: Colors.grey),),
            const SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("计划时间", style: TextStyle(fontSize: 12.sp, color: Colors.grey),),
                Text("${e.goTime}至${e.backTime}", style: TextStyle(fontSize: 12.sp, color: Colors.black),),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("计划人数", style: TextStyle(fontSize: 12.sp, color: Colors.grey),),
                Text("${e.people}人", style: TextStyle(fontSize: 12.sp, color: Colors.black),),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("预算金额", style: TextStyle(fontSize: 12.sp, color: Colors.grey),),
                Text("￥${e.money}", style: TextStyle(fontSize: 12.sp, color: Colors.black),),
              ],
            ),
          ],
        ),
      ),
      onTap: () {
        Get.toNamed(Routes.travel, arguments: e);
      },
    );
  }
}