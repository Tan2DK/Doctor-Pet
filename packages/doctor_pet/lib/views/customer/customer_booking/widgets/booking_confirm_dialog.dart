import 'package:doctor_pet/utils/app_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:doctor_pet/core/data/branch_model.dart';
import 'package:doctor_pet/core/data/slot_in_day_model.dart';

class BookingConfirmDialog extends StatelessWidget {
  const BookingConfirmDialog({
    Key? key,
    required this.branch,
    required this.slotInDay,
    this.onConfirm,
  }) : super(key: key);

  final BranchModel branch;
  final SlotInDayModel slotInDay;
  final Function()? onConfirm;

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now().copyWith(
      hour: 0,
      minute: 0,
      second: 0,
      microsecond: 0,
      millisecond: 0,
    );
    return AlertDialog(
      insetPadding: const EdgeInsets.all(16),
      content: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 300,
          maxHeight: 300,
        ),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Expanded(
              child: Row(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Clinic Branch: '),
                      Text('Reservation Date: '),
                      Text('Reservation Time: '),
                    ],
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(branch.name),
                      Text(now
                          .add(Duration(days: slotInDay.nextDay))
                          .formatDateTime('dd MMMM yyyy')),
                      Text(slotInDay.fixedSlot.getName),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            FilledButton(onPressed: Get.back, child: const Text('Cancel')),
            const SizedBox(height: 16),
            FilledButton(onPressed: Get.back, child: const Text('Confirm')),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
