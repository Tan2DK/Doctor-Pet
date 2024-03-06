import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:doctor_pet/core/config/constants/images.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Row(
          children: [
            Container(
              width: 280,
              color: const Color(0xFFE2EFF8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Doctor Pet',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ).paddingAll(16),
                  const SizedBox(height: 8),
                  ...controller.getTabListByRole
                      .asMap()
                      .map(
                        (i, element) => MapEntry(
                          i,
                          InkWell(
                            onTap: () => controller.changeTab(i),
                            child: ColoredBox(
                              color: i == controller.index.value
                                  ? const Color(0xFFD8E5FF)
                                  : Colors.transparent,
                              child: Text(
                                element,
                                style: i == controller.index.value
                                    ? const TextStyle(
                                        fontWeight: FontWeight.bold)
                                    : null,
                              ).paddingAll(10),
                            ),
                          ),
                        ),
                      )
                      .values
                      .toList()
                ],
              ),
            ),
            Expanded(
              child: IndexedStack(
                sizing: StackFit.expand,
                index: controller.index.value,
                children: controller.listScreen(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
