import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:whatsapp/app/app_images/app_images.dart';
import 'package:whatsapp/app/colors/app_colors.dart';

import '../routes/app_routes.dart';

class Sidebar extends StatelessWidget {
  final Widget widget;

  const Sidebar({
    super.key,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.only(top: 8),
              width: 60,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                color: AppColors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BuildMenuItem(
                    image: AppImages.icHome,
                    title: "Home",
                    onTap: () {
                      Get.toNamed(AppRoutes.homePage);
                    },
                  ),
                  BuildMenuItem(
                    image: AppImages.icOrder,
                    title: "Orders",
                    onTap: () {
                      Get.toNamed(AppRoutes.orderPage);
                    },
                  ),
                  BuildMenuItem(
                    image: AppImages.icDashboard,
                    title: "Dashboard",
                    onTap: () {
                      Get.toNamed(AppRoutes.dashboard);
                    },
                  ),
                ],
              ),
            ),
          ),
          widget,
        ],
      ),
    );
  }
}

class BuildMenuItem extends StatelessWidget {
  const BuildMenuItem({
    super.key,
    required this.onTap,
    required this.image,
    required this.title,
  });

  final Function() onTap;
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          SvgPicture.asset(image),
          Text(
            title,
            style: const TextStyle(
              color: AppColors.black,
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
