import 'package:get/get.dart';

import 'location_search_controller.dart';

class LocationSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocationSearchController>(() => LocationSearchController());
  }

}