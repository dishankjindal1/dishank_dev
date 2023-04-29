import 'package:flutter/material.dart';
import 'package:frontend/web/utilities/my_pallet.dart';
import 'package:frontend/web/utilities/my_pixel.dart';
import 'package:frontend/web/utilities/my_text_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Spacer(),
        Text(
          'Dishank Jindal',
          style: MyTextStyles.titleName.copyWith(
            color: MyPallet.white,
          ),
        ),
        const Spacer(),
        Text(
          'Mobile Developer',
          style: MyTextStyles.titleDesignation.copyWith(
            color: MyPallet.white,
          ),
        ),
        const Spacer(),
        SizedBox(
          width: PixelScale.of(context).width(0.7),
          child: Text(
            'I love to design and develops solid and scalable products with great user experiences.',
            textAlign: TextAlign.center,
            style: MyTextStyles.titleTextMedium.copyWith(
              color: MyPallet.white,
            ),
          ),
        ),
        const Spacer(),
        const Spacer(),
        const Spacer(),
      ],
    );
  }
}
