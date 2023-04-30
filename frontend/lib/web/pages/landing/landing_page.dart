import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:frontend/web/pages/contact/contact_page.dart';
import 'package:frontend/web/pages/expertise/expertise_page.dart';
import 'package:frontend/web/pages/home/home_page.dart';
import 'package:frontend/web/pages/landing/components/header_module.dart';
import 'package:frontend/web/utilities/my_assets.dart';
import 'package:frontend/web/utilities/my_pallet.dart';
import 'package:frontend/web/utilities/my_pixel.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late final PageController imageCtrl;
  late final PageController pageCtrl;

  late final ValueNotifier<bool> hireMeListener;

  @override
  void initState() {
    super.initState();
    imageCtrl = PageController();
    pageCtrl = PageController();
    hireMeListener = ValueNotifier(true);

    pageCtrl.addListener(() {
      if (pageCtrl.page != null) {
        log(pageCtrl.page.toString());
        if (double.parse(pageCtrl.page!.toStringAsFixed(1)) <= 0.8) {
          hireMeListener.value = true;

          imageCtrl.animateToPage(0,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeIn);
        } else if ((double.parse(pageCtrl.page!.toStringAsFixed(1)) > 0.8 &&
            double.parse(pageCtrl.page!.toStringAsFixed(1)) <= 1.2)) {
          // hireMeListener.value = false;

          // imageCtrl.animateTo(pageCtrl.page! * PixelScale.of(context).height(1),
          //     duration: const Duration(milliseconds: 400),
          //     curve: Curves.easeIn);
        } else if ((double.parse(pageCtrl.page!.toStringAsFixed(1)) > 1.2 &&
            double.parse(pageCtrl.page!.toStringAsFixed(1)) <= 1.8)) {
          hireMeListener.value = false;

          imageCtrl.animateToPage(1,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeIn);
        } else if ((double.parse(pageCtrl.page!.toStringAsFixed(1)) > 1.8 &&
            double.parse(pageCtrl.page!.toStringAsFixed(1)) <= 2.2)) {
          // hireMeListener.value = false;

          // imageCtrl.animateTo(pageCtrl.page! * PixelScale.of(context).height(1),
          //     duration: const Duration(milliseconds: 400),
          //     curve: Curves.easeIn);
        } else if ((double.parse(pageCtrl.page!.toStringAsFixed(1)) > 2.2 &&
            double.parse(pageCtrl.page!.toStringAsFixed(1)) <= 2.8)) {
          hireMeListener.value = false;

          imageCtrl.animateToPage(1,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeIn);
        } else if ((double.parse(pageCtrl.page!.toStringAsFixed(1)) > 2.8 &&
            double.parse(pageCtrl.page!.toStringAsFixed(1)) <= 3.2)) {
          // hireMeListener.value = false;

          // imageCtrl.animateTo(pageCtrl.page! * PixelScale.of(context).height(1),
          //     duration: const Duration(milliseconds: 400),
          //     curve: Curves.easeIn);
        } else if (double.parse(pageCtrl.page!.toStringAsFixed(1)) > 3.2) {
          hireMeListener.value = false;

          imageCtrl.animateToPage(2,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeIn);
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    imageCtrl.dispose();
    pageCtrl.dispose();
    hireMeListener.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: Scaffold(
        backgroundColor: MyPallet.black,
        body: Stack(
          children: [
            PageView.custom(
              controller: imageCtrl,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              pageSnapping: false,
              childrenDelegate: SliverChildListDelegate(
                [
                  Image.asset(
                    MyAssets.homeBgImage,
                    width: PixelScale.of(context).width(1),
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    MyAssets.expertiseBgImage,
                    width: PixelScale.of(context).width(1),
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    MyAssets.contactMeBgImage,
                    width: PixelScale.of(context).width(1),
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
              child: CustomScrollView(
                controller: pageCtrl,
                slivers: [
                  SliverPersistentHeader(
                    delegate: MyCustomHeaderLayout(
                      hireMeListener: hireMeListener,
                      pageCtrl: pageCtrl,
                    ),
                    pinned: true,
                  ),
                  SliverFillViewport(
                    delegate: SliverChildListDelegate([
                      const HomePage(),
                      SizedBox(height: PixelScale.of(context).height(1)),
                      const ExpertisePage(),
                      SizedBox(height: PixelScale.of(context).height(1)),
                      const ContactPage(),
                    ]),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () {
                  showBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          width: 100,
                          height: 300,
                          color: MyPallet.white,
                        );
                      });
                },
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 100, 48),
                  child: SizedBox.square(
                    dimension: 48,
                    child: Image.asset(
                      MyAssets.chatBubble,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
