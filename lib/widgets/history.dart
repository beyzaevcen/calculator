import 'package:calculater/controllers/home_controller.dart';
import 'package:calculater/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryModal extends StatelessWidget {
  const HistoryModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        title: const Text(
          "History",
          textAlign: TextAlign.center,
        ),
        content: Wrap(
            children: controller.history
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Chip(
                      label: Text(
                        e.toString(),
                        style: const TextStyle(color: CColors.black, fontSize: 30),
                      ),
                    ),
                  ),
                )
                .toList()));
  }

  static void open() => Get.dialog(const HistoryModal());
}
