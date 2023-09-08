import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:travel_gpt/module/location/location_controller.dart';
import 'package:travel_gpt/util/hex_to_color.dart';

class LocationScreen extends GetView<LocationController> {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.textEditingController.text = "";
    return Scaffold(
      backgroundColor: hexToColor("#F5F5F5"),
      body: GetBuilder<LocationController>(
        id: "main",
        builder: (controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(height: ScreenUtil().statusBarHeight, color: Colors.white,),
              Container(
                height: 44,
                color: Colors.white,
                child: Row(
                  children: [
                    SizedBox(width: 15.w,),
                    GestureDetector(
                      child: Image.asset("assets/返回.png", color: Colors.black, height: 16.h,),
                      onTap: () {
                        Get.back();
                      },
                    ),
                    SizedBox(width: 10.w,),
                    Expanded(
                      child: Container(
                        height: 32.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: hexToColor("#F5F5F5")
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: TextField(
                            controller: controller.textEditingController,
                            // showCursor: false,
                            style: TextStyle(
                              fontSize: 14.sp,
                            ),
                            decoration: InputDecoration(
                              hintText: "搜索城市/县区",
                              hintStyle: TextStyle(
                                  fontSize: 14.sp,
                                  color: hexToColor("#999999")),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 15.w,
                                  bottom: 8.h,
                                  right: 15.w),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15.w,),
                  ],
                ),
              ),
              if (!controller.isSearch && controller.searchHistory.isNotEmpty)
                SizedBox(height: 10.h,),
              if (!controller.isSearch && controller.searchHistory.isNotEmpty)
                Container(
                  padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 10.h, bottom: 15.h),
                  width: 375.w,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("最近搜索", style: TextStyle(fontSize: 16.sp, color: Colors.black, fontWeight: FontWeight.bold),),
                      SizedBox(height: 15.h,),
                      GetBuilder<LocationController>(
                        id: "",
                        builder: (controller) {
                          return Wrap(
                            spacing: 10.w,
                            runSpacing: 10.w,
                            children: controller.searchHistory.map((e) => GestureDetector(
                              child: Container(
                                padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 8.h,bottom: 8.h),
                                decoration: BoxDecoration(
                                    color: hexToColor("#2F3337").withOpacity(.05),
                                    borderRadius: BorderRadius.circular(4.r)
                                ),
                                child: Text(e, style: TextStyle(fontSize: 14.sp, color: Colors.black),),
                              ),
                              onTap: () {
                                Get.back(result: e);
                              },
                            )).toList(),
                          );
                        },
                      )
                    ],
                  ),
                ),
              if (!controller.isSearch)
                SizedBox(height: 10.h,),
              if (!controller.isSearch)
                Container(
                  padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 10.h, bottom: 15.h),
                  color: Colors.white,
                  width: 375.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("热门城市", style: TextStyle(fontSize: 16.sp, color: Colors.black, fontWeight: FontWeight.bold),),
                      SizedBox(height: 15.h,),
                      Wrap(
                        spacing: 10.w,
                        runSpacing: 10.w,
                        children: controller.hotCity.map((e) => GestureDetector(
                          child: Container(
                            padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 8.h,bottom: 8.h),
                            decoration: BoxDecoration(
                                color: hexToColor("#2F3337").withOpacity(.05),
                                borderRadius: BorderRadius.circular(4.r)
                            ),
                            child: Text(e, style: TextStyle(fontSize: 14.sp, color: Colors.black),),
                          ),
                          onTap: () {
                            Get.back(result: e);
                          },
                        )).toList(),
                      )
                    ],
                  ),
                ),
              if (!controller.isSearch)
                SizedBox(height: 10.h,),
              if (controller.isSearch)
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.searchCityList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: Container(
                            height: 46.h,
                            color: Colors.white,
                            padding: EdgeInsets.only(left: 50.w),
                            alignment: Alignment.centerLeft,
                            child: controller.text(controller.searchCityList[index])
                        ),
                        onTap: () {
                          controller.back(controller.searchCityList[index]);
                        },
                      );
                    },
                  ),
                )
            ],
          );
        },
      ),
    );
  }

}