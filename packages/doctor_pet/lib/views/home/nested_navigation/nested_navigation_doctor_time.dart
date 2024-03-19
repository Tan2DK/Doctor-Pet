// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../utils/app_routes.dart';
// import '../../pet/pet_binding.dart';
// import '../../pet/pet_view.dart';
// import 'package:doctor_pet/views/doctor/doctor_scheduletime/doctor_scheduletime_binding.dart';
// import 'package:doctor_pet/views/doctor/doctor_scheduletime/doctor_scheduletime_view.dart';

// class NestedNavigationTimeDoctor extends StatelessWidget {
//   const NestedNavigationTimeDoctor({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Navigator(
//       key: Get.nestedKey(RoutesName.nestedNavPet),
//       initialRoute: "/",
//       onGenerateRoute: (settings) {
//         return GetPageRoute(
//           settings: settings,
//           binding: DoctorScheduletimeBinding(),
//           page: () => const DoctorScheduletimeView(),
//         );
//       },
//     );
//   }
// }
