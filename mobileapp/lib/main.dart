import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:travel_gpt/route/routes.dart';
import 'package:travel_gpt/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          initialRoute: Routes.home,
          getPages: Routes.routes,
          title: "TravelGPT",
          theme: AppTheme.themeData(),
          themeMode: ThemeMode.light,
          darkTheme: AppTheme.themeData(isLightModel: false),
          home: child,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // 英语
            Locale('zh', 'CN'), // 简体中文
          ],
          builder: EasyLoading.init(),
        );
      },
    );
  }
}
