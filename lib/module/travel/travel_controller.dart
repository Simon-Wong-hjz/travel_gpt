import 'dart:ui' as ui;
import "package:universal_html/html.dart" as html;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:travel_gpt/obj/travel_info.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';


class TravelController extends GetxController {
  late TravelInfo travelInfo;
  int totalCost = 0;
  bool showTable = false;

  @override
  void onInit() {
    super.onInit();
    travelInfo = Get.arguments;
    for (var element in travelInfo.travelDestination!.dayList) {
      for (var e in element.playList) {
        totalCost += e.playMoney;
      }
    }
  }

  void changeExpansion(int index) {
    travelInfo.travelDestination!.dayList[index].isExpanded =
        !travelInfo.travelDestination!.dayList[index].isExpanded;
    update(["list"]);
  }

  GlobalKey globalKey = GlobalKey();

  Future<void> captureAndSaveImage() async {
    RenderRepaintBoundary boundary =
    globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;

    // 获取整个RepaintBoundary的绘制图像
    final image = await boundary.toImage(pixelRatio: 3.0);

    // 将图像数据转换为Uint8List
    final ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final buffer = byteData!.buffer.asUint8List();

    // 将图片保存到本地
    // 可以使用path_provider或其他插件来获取存储路径
    // 这里仅为示例，假设保存到应用的文档目录
    // 假设图片名称为 "widget_image.png"
    // 请根据您的需求来指定文件保存路径和名称
    // 最后，您可以使用Image.file来加载这个本地图片
    // 将图片保存到Blob对象
    if (kIsWeb) {
      final blob = html.Blob([Uint8List.fromList(buffer)]);

      // 创建下载链接
      final url = html.Url.createObjectUrlFromBlob(blob);

      // 创建一个<a>元素
      final anchor = html.AnchorElement(href: url)
        ..target = 'image.png' // 指定下载的文件名
        ..download = 'travel.png' // 指定下载的文件名
        ..text = 'Download Image';

      // 添加<a>元素到body
      html.document.body!.children.add(anchor);

      // 模拟点击下载链接
      anchor.click();

      // 释放资源
      html.Url.revokeObjectUrl(url);
      EasyLoading.showSuccess("保存成功");
    } else {
      // 保存图片到相册
      final result = await ImageGallerySaver.saveImage(Uint8List.fromList(buffer), name: '${DateTime.now().millisecondsSinceEpoch}.png');

      if (result != null) {
        // 图片保存成功
        EasyLoading.showSuccess("保存成功");
      } else {
        // 图片保存失败
        EasyLoading.showError("保存失败");
      }
    }


  }

  void changeShowTable(bool flag) {
    if (flag == showTable) {
      return;
    }
    showTable = flag;
    update(["showTable"]);
  }
}
