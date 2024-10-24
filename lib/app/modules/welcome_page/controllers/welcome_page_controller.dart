import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class WelcomePageController extends GetxController {
  final PageController pageController = PageController();
  final currentPage = 0.obs;
  final languange = 'in'.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent));
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  int onPageChanged(int page) {
    currentPage.value = page;
    return currentPage.value;
  }

  void onChangedLanguage(String cointry) {
    languange.value = cointry;
  }

  void increment() => count.value++;
}
