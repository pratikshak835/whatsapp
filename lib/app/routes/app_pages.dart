import 'package:get/get.dart';
import 'package:whatsapp/app/routes/app_routes.dart';
import 'package:whatsapp/dashboard_page.dart';
import 'package:whatsapp/home_page.dart';
import 'package:whatsapp/order_page.dart';

class AppPages {
  const AppPages._();

  static final routes = [
    GetPage(
      name: AppRoutes.homePage,
      transition: Transition.noTransition,
      transitionDuration: Duration.zero,
      page: () => const HomePage(), /*binding:*/
    ),
    GetPage(
      name: AppRoutes.orderPage,
      transition: Transition.noTransition,
      transitionDuration: Duration.zero,
      page: () => const OrderPage(), /*binding:*/
    ),
    GetPage(
      name: AppRoutes.dashboard,
      transition: Transition.noTransition,
      transitionDuration: Duration.zero,
      page: () => DashboardPage(), /*binding:*/
    ),
  ];
}
