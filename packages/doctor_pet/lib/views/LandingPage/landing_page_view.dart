import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doctor_pet/views/LandingPage/Widgets/banner_widget.dart';
import 'package:doctor_pet/views/LandingPage/Widgets/content_widget.dart';
import 'package:doctor_pet/views/LandingPage/Widgets/bottom_widget.dart';
import 'package:doctor_pet/views/LandingPage/Widgets/top_widget.dart';
import 'package:doctor_pet/views/LandingPage/landing_page_controller.dart';

class LandingPageView extends GetView<LandingPageController> {
  const LandingPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xffFEEAEA),
      body: LayoutBuilder(
        builder: (_, constraints) {
          return ListView(
            shrinkWrap: true,
            children: [
              const TopBarWidget(),
              const BannerWidget(),
              SizedBox(
                  height: constraints.maxWidth > 600
                      ? 60
                      : 47), // Responsive height
              const ContentWidget(),
              SizedBox(
                  height: constraints.maxWidth > 600
                      ? 400
                      : 331), // Responsive height
              const BottomWidget(),
            ],
          );
        },
      ),
    );
  }
}
