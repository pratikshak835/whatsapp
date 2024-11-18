import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsapp/app/app_images/app_images.dart';
import 'package:whatsapp/app/colors/app_colors.dart';
import 'package:whatsapp/app/common/strings.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                AppImages.icLogoBackground,
              ),
              SvgPicture.asset(
                AppImages.icLogo,
                colorFilter:
                    const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                width: 24,
                height: 24,
              ),
            ],
          ),
          const SizedBox(
            width: 8,
          ),
          const Text(
            Strings.appName,
            style: TextStyle(color: AppColors.white),
          ),
        ],
      ),
      automaticallyImplyLeading: false,
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: Colors.white.withOpacity(0.2)),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.person,
                  color: AppColors.white,
                )),
          ),
        )
      ],
      backgroundColor: AppColors.kPrimaryColor,
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
