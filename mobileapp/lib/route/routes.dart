import 'package:get/get.dart';
import 'package:travel_gpt/module/history/history_binding.dart';
import 'package:travel_gpt/module/history/history_screen.dart';
import 'package:travel_gpt/module/home/home_binding.dart';
import 'package:travel_gpt/module/home/home_screen.dart';
import 'package:travel_gpt/module/location/location_binding.dart';
import 'package:travel_gpt/module/location/location_screen.dart';
import 'package:travel_gpt/module/travel/travel_binding.dart';
import 'package:travel_gpt/module/travel/travel_screen.dart';

class Routes {
  static const String home = "/home";
  static const String location = "/location";
  static const String history = "/history";
  static const String travel = "/travel";
  static final routes = [
    GetPage(
        name: Routes.home,
        page: () => const HomeScreen(),
        binding: HomeBinding()
    ),
    GetPage(
        name: Routes.location,
        page: () => const LocationScreen(),
        binding: LocationBinding(),
    ),
    GetPage(
        name: Routes.history,
        page: () => const HistoryScreen(),
        binding: HistoryBinding()
    ),
    GetPage(
        name: Routes.travel,
        page: () => const TravelScreen(),
        binding: TravelBinding()
    ),
  ];
}