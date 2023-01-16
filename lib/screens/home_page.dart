import 'package:calculater/controllers/home_controller.dart';
import 'package:calculater/utils/theme.dart';
import 'package:calculater/widgets/check.dart';
import 'package:calculater/widgets/history.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      backgroundColor: CColors.backgroundcolor,
      body: Center(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Ink(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: CColors.foregroundBlack,
                  ),
                  height: Get.height / 3,
                  width: double.infinity,
                  child: Obx(
                    () => Center(
                        child: controller.results.isEmpty
                            ? const Text(
                                "No action has been selected yet.",
                                style: TextStyle(
                                  color: CColors.white,
                                  fontSize: 20,
                                  decoration: TextDecoration.underline,
                                ),
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: controller.results
                                    .map(
                                      (e) => Text(
                                        e.toString(),
                                        style: const TextStyle(color: CColors.white, fontSize: 30),
                                      ),
                                    )
                                    .toList(),
                              )),
                  ),
                ),
                const SafeArea(
                    child: IconButton(
                  onPressed: HistoryModal.open,
                  icon: Icon(
                    FontAwesomeIcons.clock,
                    color: CColors.white,
                  ),
                )),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextFormField(
                controller: controller.firstNumber,
                keyboardType: TextInputType.number,
                style: const TextStyle(color: CColors.subtitleColor),
                decoration: (InputDecoration(
                    alignLabelWithHint: true,
                    focusedBorder: OutlineInputBorder(
                      gapPadding: 8,
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: CColors.mainColor, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      gapPadding: 8,
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: CColors.subtitleColor, width: 1),
                    ),
                    border: InputBorder.none,
                    fillColor: CColors.white,
                    labelText: "First Number",
                    labelStyle: const TextStyle(color: CColors.subtitleColor),
                    hintStyle: const TextStyle(color: CColors.subtitleColor))),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextFormField(
                controller: controller.secondNumber,
                keyboardType: TextInputType.number,
                style: const TextStyle(color: CColors.subtitleColor),
                decoration: (InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      gapPadding: 8,
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: CColors.mainColor, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      gapPadding: 8,
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: CColors.subtitleColor, width: 1),
                    ),
                    border: InputBorder.none,
                    fillColor: CColors.white,
                    labelText: "Second Number",
                    labelStyle: const TextStyle(color: CColors.subtitleColor),
                    hintStyle: const TextStyle(color: CColors.subtitleColor))),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListTile(
                  onTap: () {
                    controller.function.value = "add";
                  },
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(color: CColors.subtitleColor),
                  ),
                  leading: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  title: const Text(
                    "Add",
                    style: TextStyle(color: CColors.subtitleColor),
                  ),
                  trailing: Obx(
                    () => controller.function.value == "add"
                        ? const Icon(
                            Icons.check_circle_outline,
                            color: CColors.white,
                          )
                        : const Icon(
                            Icons.circle_outlined,
                            color: CColors.white,
                          ),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListTile(
                  onTap: () {
                    controller.function.value = "substract";
                  },
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(color: CColors.subtitleColor),
                  ),
                  leading: const Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                  title: const Text(
                    "Substract",
                    style: TextStyle(color: CColors.subtitleColor),
                  ),
                  trailing: Obx(
                    () => controller.function.value == "substract"
                        ? const Icon(
                            Icons.check_circle_outline,
                            color: CColors.white,
                          )
                        : const Icon(
                            Icons.circle_outlined,
                            color: CColors.white,
                          ),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListTile(
                  onTap: () {
                    controller.function.value = "multiply";
                  },
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(color: CColors.subtitleColor),
                  ),
                  leading: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                  title: const Text(
                    "Multiply",
                    style: TextStyle(color: CColors.subtitleColor),
                  ),
                  trailing: Obx(
                    () => controller.function.value == "multiply"
                        ? const Icon(
                            Icons.check_circle_outline,
                            color: CColors.white,
                          )
                        : const Icon(
                            Icons.circle_outlined,
                            color: CColors.white,
                          ),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListTile(
                  onTap: () {
                    controller.function.value = "divide";
                  },
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(color: CColors.subtitleColor),
                  ),
                  leading: const Icon(
                    FontAwesomeIcons.divide,
                    color: Colors.white,
                  ),
                  title: const Text(
                    "Divide",
                    style: TextStyle(color: CColors.subtitleColor),
                  ),
                  trailing: Obx(
                    () => controller.function.value == "divide"
                        ? const Icon(
                            Icons.check_circle_outline,
                            color: CColors.white,
                          )
                        : const Icon(
                            Icons.circle_outlined,
                            color: CColors.white,
                          ),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: controller.clear,
                  child: Ink(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: CColors.foregroundBlack,
                    ),
                    width: 150,
                    height: 50,
                    child: const Center(
                      child: Text(
                        "Clear",
                        style: TextStyle(color: CColors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 32,
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    if (controller.secondNumber.text.isEmpty ||
                        controller.firstNumber.text.isEmpty) {
                      Get.dialog(const CheckModal());
                    } else {
                      if (controller.function.value == "add") {
                        controller.addFunc();
                      } else if (controller.function.value == "substract") {
                        controller.substract();
                      } else if (controller.function.value == "multiply") {
                        controller.multiply();
                      } else {
                        controller.divide();
                      }
                    }
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: CColors.foregroundBlack,
                    ),
                    width: 150,
                    height: 50,
                    child: const Center(
                      child: Text(
                        "Calculate",
                        style: TextStyle(color: CColors.white),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
