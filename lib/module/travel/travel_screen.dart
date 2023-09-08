import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:travel_gpt/util/hex_to_color.dart';

import 'travel_controller.dart';

class TravelScreen extends GetView<TravelController> {
  const TravelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              const SizedBox(
                width: 15,
              ),
              Image.asset(
                "assets/返回.png",
                color: Colors.black,
                height: 16.h,
              ),
              Text(
                "返回",
                style: TextStyle(fontSize: 12.sp, color: Colors.black),
              ),
            ],
          ),
        ),
        title: Text(
          "攻略详情",
          style: TextStyle(
              fontSize: 18.sp,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  _body() {
    return SingleChildScrollView(
      child: RepaintBoundary(
        key: controller.globalKey,
        child: Container(
          color: hexToColor("#F5F5F5"),
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Container(
                margin: EdgeInsets.only(left: 15.w, right: 15.w),
                height: 32.h,
                decoration: BoxDecoration(
                  color: controller.totalCost <= controller.travelInfo.money!
                      ? hexToColor("#08C35C").withOpacity(.1)
                      : hexToColor("#D92929").withOpacity(.1),
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: controller.totalCost <= controller.travelInfo.money!
                    ? Row(
                  children: [
                    SizedBox(
                      width: 10.w,
                    ),
                    Image.asset(
                      "assets/提示-未超出预算.png",
                      height: 16.h,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "本方案预计费用总计¥${controller.totalCost}，结余¥${controller.travelInfo.money! - controller.totalCost}",
                      style: TextStyle(
                          fontSize: 12.sp, color: hexToColor("#08C35C")),
                    ),
                  ],
                )
                    : Row(
                  children: [
                    SizedBox(
                      width: 10.w,
                    ),
                    Image.asset(
                      "assets/提示-超出预算.png",
                      height: 16.h,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "本方案预计费用总计¥${controller.totalCost}，超出¥${controller.totalCost - controller.travelInfo.money!}",
                      style: TextStyle(
                          fontSize: 12.sp, color: hexToColor("#D92929")),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 15.w,
                  ),
                  Expanded(
                    child: Text(
                      "推荐目的地",
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: hexToColor("#16191C"),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      height: 24.h,
                      width: 89.w,
                      decoration: BoxDecoration(
                        color: hexToColor("#C8007E"),
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: GestureDetector(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "下载攻略",
                              style: TextStyle(fontSize: 12.sp, color: Colors.white),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Image.asset(
                              "assets/下载.png",
                              color: Colors.white,
                              height: 16.h,
                            ),
                          ],
                        ),
                        onTap: () async{
                          await controller.captureAndSaveImage();
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                margin: EdgeInsets.only(left: 15.w, right: 15.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 64.h,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            bottom: 0,
                            right: 217.w,
                            child: Image.asset("assets/目的地简介切图.png",
                                fit: BoxFit.cover),
                          ),
                          Positioned(
                            left: 49.w,
                            top: 24.h,
                            bottom: 0,
                            child: Text(
                              controller.travelInfo.travelDestination!.destination,
                              style: TextStyle(
                                  fontSize: 36.sp,
                                  color: hexToColor("#16191C"),
                                  height: 1.1,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: 11.h, left: 15.w, right: 15.w, bottom: 11.h),
                      child: Text(
                        controller
                            .travelInfo.travelDestination!.destinationDescription,
                        maxLines: 3,
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: hexToColor("#5E666E"),
                            height: 2,
                            overflow: TextOverflow.ellipsis),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                margin: EdgeInsets.only(left: 15.w, right: 15.w),
                child: Row(
                  children: [
                    Text(
                      "旅行计划",
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: hexToColor("#2F3337"),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text(
                      "费用明细",
                      style:
                      TextStyle(fontSize: 14.sp, color: hexToColor("#9199A1")),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              GetBuilder<TravelController>(
                  id: "list",
                  builder: (controller) {
                    int i = 0;
                    return Container(
                      margin: EdgeInsets.only(left: 15.w, right: 15.w),
                      child: ExpansionPanelList(
                        expandedHeaderPadding: EdgeInsets.zero,
                        expandIconColor: Colors.transparent,
                        materialGapSize: 10.h,
                        elevation: 0,
                        expansionCallback: (int index, bool isExpanded) {
                          controller.changeExpansion(index);
                        },
                        children: controller.travelInfo.travelDestination!.dayList
                            .map((e) {
                          return ExpansionPanel(
                            canTapOnHeader: true,
                            headerBuilder: (BuildContext context, bool isExpanded) {
                              i++;
                              return ListTile(
                                title: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "第$i天",
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            color: hexToColor("#16191C"),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      "详情",
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: hexToColor("#9199A1"),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    e.isExpanded
                                        ? Image.asset(
                                      "assets/展开.png",
                                      color: hexToColor("#9199A1"),
                                      height: 16.h,
                                    )
                                        : Image.asset(
                                      "assets/收起.png",
                                      color: hexToColor("#9199A1"),
                                      height: 16.h,
                                    ),
                                  ],
                                ),
                                subtitle: Text(e.day,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: hexToColor("#9199A1"),
                                    )),
                              );
                            },
                            body: Column(children: [
                              Column(
                                children: e.playList.map((e) {
                                  return Container(
                                    margin:
                                    EdgeInsets.only(left: 15.w, right: 15.w),
                                    height: 28.h,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 100,
                                          child: Text(
                                            e.playTime,
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                overflow: TextOverflow.ellipsis,
                                                color: hexToColor("#9199A1")),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Text(
                                          e.play,
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              overflow: TextOverflow.ellipsis,
                                              color: hexToColor("#2F3337")),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Expanded(
                                            child: Container(
                                              alignment: Alignment.centerRight,
                                              child: Text(
                                                "￥${e.playMoney}",
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color: hexToColor("#2F3337")),
                                              ),
                                            )),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 15.w, right: 15.w),
                                child: Divider(
                                  height: 1,
                                  color: hexToColor("#E3E6E8"),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 15.w, right: 15.w),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                          "合计",
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: hexToColor("#9199A1")),
                                        )),
                                    Text(
                                      "￥${e.playList.fold(0, (previousValue, element) => previousValue + element.playMoney)}",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: hexToColor("#2F3337")),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                            ]),
                            isExpanded: e.isExpanded,
                          );
                        }).toList(),
                      ),
                    );
                  }),
              SizedBox(
                height: 15.h,
              ),
              Center(
                child: Text(
                  "TravelGPT祝您旅途愉快！",
                  style: TextStyle(fontSize: 12.sp, color: hexToColor("#9E9E9E")),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
