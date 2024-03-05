import 'package:get/get.dart';

import '../views/customer/customer_binding.dart';
import '../views/customer/customer_view.dart';
import '../views/home/home_binding.dart';
import '../views/home/home_view.dart';
import '../views/question&answer/q&a_binding.dart';
import '../views/question&answer/q&a_view.dart';

class AppRoutes {
  AppRoutes._();

  static final mainRoutes = [
    GetPage(
      name: RoutesName.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: RoutesName.customer,
      page: () => const CustomerView(),
      binding: CustomerBinding(),
    ),
    GetPage(
      name: RoutesName.questionAnswer,
      page: () => const QandA(),
      binding: QuestionAnswerBinding(),
    ),
  ];
}

class RoutesName {
  static const String home = '/home';
  static const String customer = '/customer';
  static const String questionAnswer = '/QandA';
}
