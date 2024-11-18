import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp/app/common/strings.dart';
import 'package:whatsapp/app/routes/app_pages.dart';
import 'package:whatsapp/app/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Strings.appName,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      initialRoute: AppRoutes.homePage,
    );
  }
}
