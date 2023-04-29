import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:frontend/web/utilities/my_assets.dart';
import 'package:frontend/web/utilities/my_box_decoration.dart';
import 'package:frontend/web/utilities/my_pallet.dart';
import 'package:frontend/web/utilities/my_text_styles.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 52),
        Text(
          'Contact Us',
          style: MyTextStyles.pageTitle.copyWith(
            color: MyPallet.white,
          ),
        ),
        const SizedBox(height: 100),
        Text(
          'dishankjindalitn@gmail.com',
          style: MyTextStyles.pageTitle.copyWith(
            color: MyPallet.white,
          ),
        ),
        const SizedBox(height: 100),
        SizedBox(
          width: 400,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox.square(
                dimension: 50,
                child: Image.asset(
                  MyAssets.logo3,
                ),
              ),
              SizedBox.square(
                dimension: 50,
                child: Image.asset(
                  MyAssets.logo4,
                ),
              ),
              SizedBox.square(
                dimension: 50,
                child: Image.asset(
                  MyAssets.logo5,
                ),
              ),
              SizedBox.square(
                dimension: 50,
                child: Image.asset(
                  MyAssets.logo6,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 100),
        GestureDetector(
          onTap: () => js.context
              .callMethod('open', ['https://www.fiverr.com/share/xAYvAD']),
          child: Container(
            alignment: Alignment.center,
            height: 48,
            width: 200,
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
        const Spacer(),
        Text(
          'Made with Flutter',
          style: MyTextStyles.footer.copyWith(
            color: MyPallet.yellow,
          ),
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}
