import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:travel_gpt/log/log.dart';
import 'package:travel_gpt/module/home/home_controller.dart';
import 'package:travel_gpt/util/hex_to_color.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _body();
  }

  Widget _body() {
    return SizedBox(
      height: 812.h,
      width: 375.w,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              color: hexToColor("#F5F5F5"),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              height: 280.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [hexToColor("#E0008D"), hexToColor("#F5F5F5")],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  tileMode: TileMode.clamp,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 20.h,
            child: SizedBox(
              height: 44.h,
              child: Row(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: GestureDetector(
                      onTap: () {
                        controller.toLocation();
                      },
                      behavior: HitTestBehavior.opaque,
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          SizedBox(
                            width: 29.w,
                            child: GetBuilder<HomeController>(
                              id: "location",
                              builder: (controller) {
                                return Text(controller.travelInfo.location == null ? "定位" : controller.travelInfo.location!,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Colors.white,
                                        height: 1.1));
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Image.asset(
                            "assets/展开.png",
                            color: Colors.white,
                            height: 16.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "TravelGPT",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          height: 1.1),
                    ),
                  )),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: () {
                          controller.toHistory();
                        },
                        behavior: HitTestBehavior.opaque,
                        child: Row(
                          textBaseline: TextBaseline.ideographic,
                          children: [
                            Text("历史记录",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.white,
                                    height: 1.1)),
                            const SizedBox(
                              width: 5,
                            ),
                            Image.asset(
                              "assets/历史记录.png",
                              color: Colors.white,
                              height: 16.h,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ),
          Positioned(
            top: 74.h,
            left: 15.w,
            right: 15.w,
            child: Card(
              color: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Container(
                padding: EdgeInsets.only(
                    left: 15.w, right: 15.w, top: 15.h, bottom: 15.h),
                height: 654.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 16.h,
                      child: Text(
                        "计划时间",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            height: 1.1),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    GestureDetector(
                      child: Container(
                        height: 32.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.w),
                            color: hexToColor("#F7F9FA")),
                        child: GetBuilder<HomeController>(
                          id: "time",
                          builder: (controller) {
                            return Row(
                              children: [
                                Expanded(
                                  child: Center(
                                      child: Text(
                                    "${controller.travelInfo.goTime}",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: hexToColor("#2F3337")),
                                  )),
                                ),
                                Image.asset(
                                  "assets/至.png",
                                  color: hexToColor("#2F3337"),
                                  height: 16.h,
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      "${controller.travelInfo.backTime}",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: hexToColor("#2F3337")),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      onTap: () {
                        controller.showDatePicker();
                      },
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    SizedBox(
                      height: 53.h,
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 16.h,
                                  child: Text(
                                    "计划人数",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        height: 1.1),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Container(
                                  height: 32.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.w),
                                      color: hexToColor("#F7F9FA")),
                                  child: Row(children: [
                                    SizedBox(
                                      width: 12.w,
                                    ),
                                    GetBuilder<HomeController>(
                                      id: "people",
                                      builder: (controller) {
                                        return Center(
                                          child: Text(
                                            "${controller.travelInfo.people}",
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                height: 1.1,
                                                color: hexToColor("#2F3337")),
                                          ),
                                        );
                                      },
                                    ),
                                    Expanded(child: Container()),
                                    GestureDetector(
                                      child: Icon(
                                        Icons.remove,
                                        color: hexToColor("#2F3337"),
                                        size: 16,
                                      ),
                                      onTap: () {
                                        controller.changePeople(-1);
                                      },
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    GestureDetector(
                                      child: Icon(Icons.add,
                                          color: hexToColor("#2F3337"),
                                          size: 16),
                                      onTap: () {
                                        controller.changePeople(1);
                                      },
                                    ),
                                    SizedBox(
                                      width: 12.w,
                                    ),
                                  ]),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 16.h,
                                  child: Text(
                                    "预算金额(¥)",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        height: 1.1),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Container(
                                  height: 32.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.w),
                                      color: hexToColor("#F7F9FA")),
                                  child: Row(children: [
                                    SizedBox(
                                      width: 12.w,
                                    ),
                                    GetBuilder<HomeController>(
                                      id: "money",
                                      builder: (controller) {
                                        return Center(
                                          child: Text(
                                            "${controller.travelInfo.money}",
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                height: 1.1,
                                                color: hexToColor("#2F3337")),
                                          ),
                                        );
                                      },
                                    ),
                                    Expanded(child: Container()),
                                    GestureDetector(
                                      child: Icon(
                                        Icons.remove,
                                        color: hexToColor("#2F3337"),
                                        size: 16,
                                      ),
                                      onTap: () {
                                        controller.changeMoney(-100);
                                      },
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    GestureDetector(
                                      child: Icon(Icons.add,
                                          color: hexToColor("#2F3337"),
                                          size: 16),
                                      onTap: () {
                                        controller.changeMoney(100);
                                      },
                                    ),
                                    SizedBox(
                                      width: 12.w,
                                    ),
                                  ]),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    SizedBox(
                      height: 16.h,
                      child: Text(
                        "关键词",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            height: 1.1),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Container(
                      height: 295.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.w),
                          color: hexToColor("#F7F9FA")),
                      child: GetBuilder<HomeController>(
                        id: "keyInput",
                        builder: (controller) {
                          return textInputTags();
                        },
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    SizedBox(
                        height: 16.h,
                        child: Row(
                          children: [
                            Text(
                              "热门关键词",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  height: 1.1),
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Image.asset("assets/热门.png"),
                            Text(
                              "点击关键词即可添加",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: hexToColor("#999999"),
                                  height: 1),
                            ),
                            Expanded(child: Container()),
                            Text(
                              "编辑",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.black,
                                  height: 1),
                            ),
                            Image.asset(
                              "assets/编辑.png",
                              color: Colors.black,
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      height: 116.h,
                      child: GetBuilder<HomeController>(
                        id: "",
                        builder: (controller) {
                          return Wrap(
                            spacing: 10.w,
                            runSpacing: 10.h,
                            children: controller.keyList
                                .map((e) => GestureDetector(
                              child: Container(
                                padding: EdgeInsets.only(
                                  left: 15.w,
                                  right: 15.w,
                                  bottom: 8.h,
                                  top: 8.h,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(4.w),
                                    color: hexToColor(e.color)
                                        .withOpacity(.05)),
                                child: Text(
                                  e.name,
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: hexToColor(e.color)),
                                ),
                              ),
                              onTap: () {
                                if (controller.selectKey.firstWhereOrNull((element) => element.name == e.name) != null) {
                                  EasyLoading.showToast("关键词已存在");
                                  return;
                                }
                                controller.addKey(e.name);
                              },
                            ))
                                .toList(),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 15.h,
            top: 743.h,
            left: 15.w,
            right: 15.w,
            child: GestureDetector(
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.r),
                ),
                color: hexToColor("#E0008D"),
                child: Center(
                  child: Text(
                    "生成策略",
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              onTap: () {
                controller.toStrategy();
              },
            ),
          )
        ],
      ),
    );
  }

  Widget textInputTags() {
    List<Widget> list = controller.selectKey.map((e) =>
        Container(
          height: 37.h,
          child: IntrinsicWidth(
            child: Stack(
              children: [
                Container(
                  height: 37.h,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    height: 32.h,
                    margin: EdgeInsets.only(right: 5.h),
                    padding: EdgeInsets.only(
                      left: 15.w,
                      right: 15.w,
                    ),
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(4.w),
                        color: hexToColor(e.color)
                            .withOpacity(.05)),
                    alignment: Alignment.center,
                    child: Text(
                      e.name,
                      style: TextStyle(
                          fontSize: 14.sp,
                          height: 1.2,
                          color: hexToColor(e.color)),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: GestureDetector(
                      onTap: () {
                        controller.removeKey(e);
                      },
                      child: CircleAvatar(
                        radius: 8,
                        backgroundColor: hexToColor("#2F3337").withOpacity(.4),
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 12,
                        ),
                      )
                  ),
                ),
              ],
            ),
          ),
        )
    ).toList();
    list.add(
      Container(
        width: 150,
        height: 37.h,
        alignment: Alignment.centerLeft,
        child: Center(
          child: TextField(
            controller: controller.textEditingController,
            // showCursor: false,
            focusNode: controller.textFocusNode,
            style: TextStyle(
                fontSize: 14.sp,
                ),
            decoration: InputDecoration(
              hintText: "输入关键词",
              hintStyle: TextStyle(
                  fontSize: 14.sp,
                  height: .8,
                  color: hexToColor("#999999")),
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(
                  left: 15.w,
                  right: 15.w,
                  bottom: 8.h,
                  top: 8.h),
            ),
            onSubmitted: (value) {
              if (value.trim().length >= 6) {
                EasyLoading.showToast("关键词最多5个字");
                return;
              }
              if (value.trim().isEmpty) {
                EasyLoading.showToast("关键词不能为空");
                return;
              }
              if (controller.selectKey.firstWhereOrNull((element) => element.name == value.trim()) != null) {
                EasyLoading.showToast("关键词已存在");
                return;
              }
              controller.addKey(value.trim());
            },
            onEditingComplete: () {
            },
          ),
        ),
      ));
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Wrap(
        spacing: 10.w,
        runSpacing: 10.h,
        children: list,
      ),
    );
  }
}
