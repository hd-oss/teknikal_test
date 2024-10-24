import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teknikal_test/app/routes/app_pages.dart';

import '../controllers/welcome_page_controller.dart';

class WelcomePageView extends GetView<WelcomePageController> {
  const WelcomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> itemViewPage = List.generate(3, (index) => const PageItem());

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LanguageSwitcher(controller: controller),
                    const JakcardWidget(),
                  ],
                ),
              ),
              const Spacer(flex: 2),
              Expanded(
                flex: 5,
                child: PageView(
                    controller: controller.pageController,
                    onPageChanged: controller.onPageChanged,
                    children: itemViewPage),
              ),
              PageIndicator(
                controller: controller,
                itemCount: itemViewPage.length,
              ),
              buildGradientButton(
                  text: 'Continue as a Guest',
                  textColor: Colors.white,
                  width: MediaQuery.sizeOf(context).height / 3,
                  height: MediaQuery.sizeOf(context).height / 18,
                  borderColor: const Color(0xffFFF84B),
                  gradientColors: [
                    const Color(0xffFE5F5F),
                    const Color(0xffFC9842)
                  ],
                  onTap: () => Get.toNamed(Routes.DASHBOARD_PAGE),
                  fontSize: MediaQuery.sizeOf(context).height / 36),
              const SizedBox(height: 8),
              buildGradientButton(
                  text: 'Continue as a Guest',
                  textColor: const Color(0xffFE5F5F),
                  width: MediaQuery.sizeOf(context).height / 3,
                  height: MediaQuery.sizeOf(context).height / 18,
                  gradientColors: [
                    const Color(0xffFFF84B),
                    const Color(0xffFE5F5F)
                  ],
                  innerColor: Colors.white,
                  onTap: () {},
                  fontSize: MediaQuery.sizeOf(context).height / 36),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
      floatingActionButton: Image.asset(
        'assets/icons/JakCard (3) 3.png',
        width: 90,
      ),
    );
  }

  Widget buildGradientButton(
      {required String text,
      required double width,
      required double height,
      required List<Color> gradientColors,
      Color? innerColor,
      Color? textColor,
      Color? borderColor,
      double borderWidth = 2.0,
      VoidCallback? onTap,
      double? fontSize}) {
    return Ink(
      width: width,
      height: height,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: gradientColors,
              tileMode: TileMode.mirror),
          border: borderColor != null
              ? Border.all(color: borderColor, width: borderWidth)
              : null),
      child: InkWell(
        onTap: onTap,
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        child: Ink(
          decoration: BoxDecoration(
            color: innerColor ?? Colors.transparent,
            borderRadius: const BorderRadius.all(Radius.circular(100)),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: fontSize,
                  color: textColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

class PageItem extends StatelessWidget {
  const PageItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IntrinsicHeight(
        child: Column(
          children: [
            Image.asset('assets/images/monas.png', width: 290),
            const SizedBox(height: 16),
            Text('Explore Jakarta with Jakarta Tourist Pass',
                style: TextStyle(
                    fontSize: MediaQuery.sizeOf(context).height / 54,
                    color: const Color(0xffFE5F5F),
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

class LanguageSwitcher extends StatelessWidget {
  final WelcomePageController controller;
  const LanguageSwitcher({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            margin: const EdgeInsets.symmetric(vertical: 6.5),
            color: Colors.white,
            surfaceTintColor: Colors.white,
            elevation: 5,
            child: const SizedBox(width: 100, height: 35)),
        SizedBox(
          width: 100,
          height: 50,
          child: Obx(
            () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildLanguageIcon('in', controller),
                  _buildLanguageIcon('en', controller),
                ]),
          ),
        ),
      ],
    );
  }

  Widget _buildLanguageIcon(String langCode, WelcomePageController controller) {
    bool isSelected = controller.languange.value == langCode;
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: () => controller.onChangedLanguage(langCode),
      child: Image.asset('assets/icons/icon-$langCode.png',
          height: isSelected ? 50 : 38),
    );
  }
}

class JakcardWidget extends StatelessWidget {
  const JakcardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      color: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Row(
          children: [
            Image.asset('assets/icons/credit-card.png', height: 15),
            const SizedBox(width: 6),
            Image.asset('assets/icons/Jakcard.png', height: 20),
          ],
        ),
      ),
    );
  }
}

class PageIndicator extends StatelessWidget {
  final WelcomePageController controller;
  final int itemCount;
  const PageIndicator({
    required this.controller,
    required this.itemCount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => Obx(
                () => Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                      color: controller.currentPage.value == index
                          ? const Color(0xffFFDBA5)
                          : const Color(0xffFFEBE8),
                      shape: BoxShape.circle),
                ),
              ),
          separatorBuilder: (_, __) => const SizedBox(width: 4),
          itemCount: itemCount),
    );
  }
}
