import 'package:flutter/material.dart';
import 'package:frontend/web/utilities/my_pallet.dart';
import 'package:frontend/web/utilities/my_pixel.dart';
import 'package:frontend/web/utilities/my_text_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Dishank Jindal',
            style: MyTextStyles.titleName.copyWith(
              color: MyPallet.white,
            ),
          ),
          Text(
            'Mobile Developer',
            style: MyTextStyles.titleDesignation.copyWith(
              color: MyPallet.white,
            ),
          ),
          SizedBox(
            width: PixelScale.of(context).width(0.5),
            child: Text(
              'I love to design and develops solid and scalable products with great user experiences.',
              style: MyTextStyles.titleTextMedium.copyWith(
                color: MyPallet.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
