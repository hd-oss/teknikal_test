import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../controllers/dashboard_page_controller.dart';

class DashboardPageView extends GetView<DashboardPageController> {
  const DashboardPageView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DashboardPageController());
    final width = MediaQuery.sizeOf(context).width;
    final feature = [
      {'asset': 'assets/icons/Group 34363.png', 'title': 'Explore Jakarta'},
      {'asset': 'assets/icons/wallet 2.png', 'title': 'Top Up JakCard'},
      {
        'asset': 'assets/icons/credit-cards (2) 1.png',
        'title': 'JakCard Balance'
      },
      {'asset': 'assets/icons/event 1.png', 'title': 'Event'},
    ];

    final touristPass = [
      {
        'asset':
            'assets/images/a818eb32-a8d5-4b0f-af72-3b0e918c1724-1639490595095-fe238e143b57d9e77ce94ae24c5f59df 1.png',
        'title': 'Ancol Entrance Gate'
      },
      {
        'asset':
            'assets/images/stock-photo-the-national-museum-of-indonesia-it-is-an-archeological-historical-ethnological-and-364969625 3.png',
        'title': 'Monumen Nasional'
      },
      {
        'asset':
            'assets/images/stock-photo-dki-jakarta-jakarta-indonesia-december-front-gate-of-pusat-primata-schmutzer-in-1581865765 1.png',
        'title': 'Monumen Nasional'
      },
    ];

    final event = [
      'assets/images/WhatsApp Image 2023-09-13 at 15.57 6.png',
      'assets/images/WhatsApp Image 2023-09-13 at 15.57 7.png'
    ];

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(children: [
              Stack(
                children: [
                  CustomPaint(
                    size: Size(width, width / 1.91326530612),
                    painter: CustomBackgroundPainter(),
                  ),
                  SafeArea(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(children: [
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Image.asset(
                                    'assets/icons/Logo Jakarta Tourist Pass.png',
                                    width: 140),
                              ),
                            ),
                            _buildIcon('assets/icons/Group 34135.png'),
                            const SizedBox(width: 8),
                            _buildIcon(null, icon: Icons.notifications),
                          ]),
                        ),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(children: [
                            Image.asset('assets/icons/profile-user 2.png',
                                width: 50),
                            const SizedBox(width: 12),
                            Text.rich(
                              TextSpan(
                                  text: 'Good morning,\n',
                                  children: const [TextSpan(text: 'Guest')],
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.sizeOf(context).height /
                                              54,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ]),
                        ),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: _buildBalanceCard(),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: feature
                        .asMap()
                        .entries
                        .map((e) => _buildFeatureSection(
                            e.value['title'] ?? '-', e.value['asset'] ?? '-'))
                        .toList()),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 95,
                child: ListView.separated(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(left: 24),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        Image.asset('assets/images/E-Banner (1) 1.png'),
                    separatorBuilder: (_, __) => const SizedBox(width: 6),
                    itemCount: 2),
              ),
              const SizedBox(height: 16),
              _buildTitleContent(
                'assets/icons/landmark 1.png',
                'Let’s Go with Jakarta Tourist Pass',
                'a place not to be missed',
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 170,
                child: ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(left: 24),
                    scrollDirection: Axis.horizontal,
                    children: [
                      Image.asset('assets/icons/Frame 34377.png', width: 80),
                      const SizedBox(width: 16),
                      ...touristPass.asMap().entries.map((e) =>
                          _buildTouristPassSection(
                              e.value['title'] ?? '-', e.value['asset'] ?? '-'))
                    ].toList()),
              ),
              const SizedBox(height: 16),
              _buildTitleContent(
                'assets/icons/calendar 1.png',
                'Events in Jakarta',
                'don\'t miss the current events',
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 185,
                child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: 24),
                    children: event
                        .asMap()
                        .entries
                        .map((e) => _buildEventSection(e.value))
                        .toList()),
              ),
              const SizedBox(height: 80),
            ]),
          ),
          Positioned(bottom: 50,right: 16,
              child: Image.asset('assets/icons/JakCard (3) 3.png', width: 90)),
        ],
      ),
      floatingActionButton: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 3),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.08),
                offset: const Offset(1, 3),
                blurRadius: 4,
                spreadRadius: 2)
          ],
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xffFF4747), Color(0xffFC9842)]),
        ),
        padding: const EdgeInsets.all(8),
        child: SvgPicture.asset('assets/images/Vector.svg'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomSheet: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.08),
                offset: const Offset(0, -4),
                blurRadius: 6,
                spreadRadius: 2)
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/icons/Vector.png', width: 25),
            Image.asset('assets/icons/Vector-1.png', width: 25),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleContent(String asset, String title, String subTitle) {
    return Row(
      children: [
        Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.yellow, width: 2),
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(100),
                  topRight: Radius.circular(100)),
              gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xffFE5F5F), Color(0xffFC9842)]),
            ),
            padding: const EdgeInsets.all(8),
            child: Image.asset(asset, width: 23)),
        const SizedBox(width: 6),
        IntrinsicHeight(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text.rich(TextSpan(
                    text: '$title \n',
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: subTitle,
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.normal))
                    ])),
              ),
              Container(
                height: 3,
                width: 72,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xffFE5F5F), Color(0xffFC9842)],
                    )),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildBalanceCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 5,
        surfaceTintColor: Colors.white,
        color: Colors.white,
        child: Row(
          children: [
            Container(
                height: 80,
                width: 15,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xffFF4747), Color(0xffFFF84B)]),
                )),
            const SizedBox(width: 16),
            const Expanded(
              flex: 4,
              child: Text.rich(
                  TextSpan(text: 'Balance Account\n', children: [
                    TextSpan(text: 'Rp ', style: TextStyle(fontSize: 16)),
                    TextSpan(
                        text: '0',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ]),
                  style: TextStyle(fontSize: 16)),
            ),
            _buildTopUpButton(),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureSection(String title, String iconAsset) {
    return Column(
      children: [
        Container(
          decoration: _gradientBoxDecoration(),
          padding: const EdgeInsets.all(2.0),
          child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xffFFE3CA), Color(0xffFFffff)]),
              ),
              child: Image.asset(iconAsset, width: 50)),
        ),
        const SizedBox(height: 6),
        Text(
          title,
          style: const TextStyle(fontSize: 10, color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildTouristPassSection(String title, String iconAsset) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 4,
      child: Column(
        children: [
          SizedBox(
              width: 120,
              height: 100,
              child: Image.asset(iconAsset, width: 50, fit: BoxFit.cover)),
          const SizedBox(height: 8),
          Text(title,
              style: const TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          SizedBox(
            width: 100,
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: const Color(0xffFFF84B)),
                  borderRadius: BorderRadius.circular(100),
                  gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment(0, -5),
                      colors: [Color(0xffFF4747), Color(0xffFFF84B)],
                      tileMode: TileMode.mirror),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                child: const Text(
                  'Detail',
                  style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventSection(String asset) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xffFE5F5F),
                const Color(0xffFC9842),
                Colors.white.withOpacity(0)
              ],
              tileMode: TileMode.mirror),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
                width: 171,
                height: 116,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                    border: Border.all(width: 4, color: Colors.white),
                    borderRadius: BorderRadius.circular(10)),
                child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.zero,
                    child: Image.asset(asset, fit: BoxFit.cover))),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: const Color(0xffFFF84B)),
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment(0, -5),
                    colors: [Color(0xffFF4747), Color(0xffFFF84B)],
                    tileMode: TileMode.mirror),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              child: const Text(
                'More Information',
                style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(String? asset, {IconData? icon}) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: const Offset(1, 3),
              blurRadius: 4,
              spreadRadius: 2)
        ],
        gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(0, -3.5),
            colors: [Color(0xffFF4747), Color(0xffFFF84B)],
            tileMode: TileMode.mirror),
      ),
      child: asset != null
          ? Image.asset(asset, width: 18)
          : Icon(icon, color: Colors.white, size: 18),
    );
  }

  Widget _buildTopUpButton() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: const Color(0xffFFF84B)),
        borderRadius: BorderRadius.circular(6),
        gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(0, -5),
            colors: [Color(0xffFF4747), Color(0xffFFF84B)],
            tileMode: TileMode.mirror),
      ),
      padding: const EdgeInsets.all(8.0),
      child: const Text(
        'Top Up',
        style: TextStyle(
            fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  BoxDecoration _gradientBoxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(6),
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xffFFF84B), Color(0xffFF4747)],
      ),
    );
  }
}

class CustomBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;

    Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(width, 0)
      ..lineTo(width, height * 0.74)
      ..quadraticBezierTo(width, height, width * 0.87, height)
      ..lineTo(width * 0.13, height)
      ..quadraticBezierTo(0, height, 0, height * 0.74)
      ..close();

    Rect gradientRect = Rect.fromLTWH(0, 0, width, height);
    Gradient gradient = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xFFFE5F5F), Color(0xFFFC9842)],
    );

    Paint paint = Paint()..shader = gradient.createShader(gradientRect);
    canvas.drawPath(path, paint);

    Paint strokePaint = Paint()
      ..color = const Color(0xFFFDF84B)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    canvas.drawPath(path, strokePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
