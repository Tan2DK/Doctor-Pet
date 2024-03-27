import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doctor_pet/views/LandingPage/Widgets/banner_widget.dart';
import 'package:doctor_pet/views/LandingPage/Widgets/content_widget.dart';
import 'package:doctor_pet/views/LandingPage/Widgets/bottom_widget.dart';
import 'package:doctor_pet/views/LandingPage/Widgets/top_widget.dart';
import 'package:doctor_pet/views/LandingPage/LandingPage_controller.dart';

class LandingPageView extends GetView<LandingPageController> {
  const LandingPageView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFEEAEA),
      body: ListView(
        shrinkWrap: true,
        children: const [
          TopBarWidget(),
          BannerWidget(),
          SizedBox(height: 47),
          ContentWidget(),
          // ItemContentWidget(), // Add ItemContentWidget here
          SizedBox(height: 331),
          BottomWidget(),
        ],
      ),
    );
  }
}
