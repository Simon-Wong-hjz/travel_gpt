import 'package:get/get.dart';
import 'package:travel_gpt/module/location/location_controller.dart';

class LocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocationController>(() => LocationController());
  }

}