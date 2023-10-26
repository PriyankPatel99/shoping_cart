import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shoping_cart/theme/themes.dart';

import 'app/routes/app_pages.dart';
import 'injection.dart' as di;

void main() {
  di.init();
  runApp(
    GetMaterialApp(
      title: "Shoping Cart",
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
