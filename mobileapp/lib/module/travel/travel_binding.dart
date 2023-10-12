import 'package:get/get.dart';
import 'package:travel_gpt/module/travel/travel_controller.dart';

class TravelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TravelController>(() => TravelController());
  }
}