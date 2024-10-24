import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});
  
  @override
  Widget build(BuildContext context) {
    Get.put(SplashScreenController());

    return Scaffold(
      body: Stack(children: [
        Center(
          child: CustomPaint(
            size: MediaQuery.of(context).size,
            painter: SvgPainter(),
          ),
        ),
        Align(
            alignment: Alignment.topLeft,
            child: SvgPicture.asset('assets/images/splash_left.svg')),
        Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset('assets/images/splash_right.svg')),
        Align(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/icons/Logo Jakarta-Tourist-Pass-OK.png',
              width: MediaQuery.sizeOf(context).width / 1.3,
            )),
        Positioned(
          bottom: 10,
          left: MediaQuery.sizeOf(context).width / 4,
          right: MediaQuery.sizeOf(context).width / 4,
          child: SafeArea(
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Image.asset('assets/icons/ojk_icon.png',
                    width: MediaQuery.sizeOf(context).width / 7),
                Image.asset('assets/icons/lps_icon.png',
                    width: MediaQuery.sizeOf(context).width / 8),
              ]),
              const SizedBox(height: 12),
              const Text('powered by Bank DKI',
                  style: TextStyle(color: Colors.white, fontSize: 12)),
              const Text('2023',
                  style: TextStyle(color: Colors.white, fontSize: 12))
            ]),
          ),
        )
      ]),
    );
  }
}

class SvgPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    const Gradient gradient = LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [Color(0xFFFF4747), Color(0xFFFC9842)],
    );

    final Paint paint = Paint()..shader = gradient.createShader(rect);
    final RRect rrect = RRect.fromRectAndRadius(rect, const Radius.circular(0));

    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
