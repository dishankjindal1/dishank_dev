import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:frontend/web/utilities/my_assets.dart';
import 'package:frontend/web/utilities/my_box_decoration.dart';
import 'package:frontend/web/utilities/my_pallet.dart';
import 'package:frontend/web/utilities/my_text_styles.dart';

class MyCustomHeaderLayout extends SliverPersistentHeaderDelegate {
  const MyCustomHeaderLayout(
      {required this.hireMeListener, required this.pageCtrl});
  final ValueNotifier<bool> hireMeListener;
  final PageController pageCtrl;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 48),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                js.context.callMethod(
                    'open', ['https://linkedin.com/in/dishankjindal']);
              },
              child: SizedBox.square(
                dimension: 48,
                child: Image.asset(
                  MyAssets.logo1,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox.square(dimension: 48),
            GestureDetector(
              onTap: () => js.context
                  .callMethod('open', ['https://github.com/dishankjindal1']),
              child: SizedBox.square(
                dimension: 48,
                child: Image.asset(
                  MyAssets.logo2,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox.square(dimension: 48),
            ValueListenableBuilder<bool>(
                valueListenable: hireMeListener,
                builder: (context, isHireMe, _) {
                  return Opacity(
                    opacity: isHireMe ? 1 : 0,
                    child: GestureDetector(
                      onTap: () => js.context.callMethod(
                          'open', ['https://www.fiverr.com/share/xAYvAD']),
                      child: Container(
                        alignment: Alignment.center,
                        height: 48,
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        decoration: BoxDecoration(
                          color: MyPallet.white,
                          borderRadius: BorderRadius.circular(
                            MyDecoration.borderRadius,
                          ),
                        ),
                        child: SizedBox(
                          height: 27,
                          child: Text(
                            'Hire Me',
                            overflow: TextOverflow.ellipsis,
                            style: MyTextStyles.textMedium.copyWith(
                              color: MyPallet.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
            const SizedBox.square(dimension: 48),
            const Spacer(),
            const SizedBox.square(dimension: 48),
            GestureDetector(
              onTapDown: (details) {
                showMenu(
                    context: context,
                    position: RelativeRect.fromSize(
                        details.globalPosition & Size.zero, Size.zero),
                    items: [
                      PopupMenuItem(
                        child: const Text('Home'),
                        onTap: () {
                          pageCtrl.animateTo(
                            0,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeIn,
                          );
                        },
                      ),
                      PopupMenuItem(
                        child: const Text('Contact Us'),
                        onTap: () {
                          pageCtrl.animateTo(
                            pageCtrl.position.maxScrollExtent,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeIn,
                          );
                        },
                      ),
                    ]);
              },
              child: SizedBox.square(
                dimension: 48,
                child: Image.asset(
                  MyAssets.menuIcon,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  double get maxExtent => 48 * 2;

  @override
  double get minExtent => 48 * 2;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
