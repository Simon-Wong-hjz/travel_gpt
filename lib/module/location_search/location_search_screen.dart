import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:travel_gpt/util/hex_to_color.dart';

import 'location_search_controller.dart';

class LocationSearchScreen extends GetView<LocationSearchController> {
  const LocationSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hexToColor("#F5F5F5"),
      body: Column(
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
                Image.asset("assets/返回.png", color: Colors.black, height: 16.h,),
                SizedBox(width: 10.w,),
                Container(
                  height: 32.h,
                  width: 319.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      color: hexToColor("#F5F5F5")
                  ),
                ),
                SizedBox(width: 15.w,),
              ],
            ),
          ),
        ],
      ),
    );
  }

}