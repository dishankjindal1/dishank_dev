import 'package:flutter/material.dart';
import 'package:frontend/web/utilities/my_pallet.dart';
import 'package:frontend/web/utilities/my_text_styles.dart';

class ExpertisePage extends StatelessWidget {
  const ExpertisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 52),
        Text(
          'Expertise',
          style: MyTextStyles.pageTitle.copyWith(
            color: MyPallet.white,
          ),
        ),
        const SizedBox(height: 100),
        Table(
          children: [
            TableRow(children: [
              Text(
                'Flutter',
                style: MyTextStyles.pageTitle.copyWith(
                  color: MyPallet.white,
                ),
              ),
              Text(
                'AWS',
                style: MyTextStyles.pageTitle.copyWith(
                  color: MyPallet.white,
                ),
              ),
            ]),
            const TableRow(children: [
              SizedBox(height: 16),
              SizedBox(height: 16),
            ]),
            TableRow(children: [
              Text(
                'Firebase',
                style: MyTextStyles.pageTitle.copyWith(
                  color: MyPallet.white,
                ),
              ),
              Text(
                'SQL',
                style: MyTextStyles.pageTitle.copyWith(
                  color: MyPallet.white,
                ),
              ),
            ]),
            const TableRow(children: [
              SizedBox(height: 16),
              SizedBox(height: 16),
            ]),
            TableRow(children: [
              Text(
                'Cloud Engineer',
                style: MyTextStyles.pageTitle.copyWith(
                  color: MyPallet.white,
                ),
              ),
              Text(
                'Java',
                style: MyTextStyles.pageTitle.copyWith(
                  color: MyPallet.white,
                ),
              ),
            ]),
            const TableRow(children: [
              SizedBox(height: 16),
              SizedBox(height: 16),
            ]),
            TableRow(children: [
              Text(
                'Dart',
                style: MyTextStyles.pageTitle.copyWith(
                  color: MyPallet.white,
                ),
              ),
              Text(
                'BLoC',
                style: MyTextStyles.pageTitle.copyWith(
                  color: MyPallet.white,
                ),
              ),
            ]),
            const TableRow(children: [
              SizedBox(height: 16),
              SizedBox(height: 16),
            ]),
            TableRow(children: [
              Text(
                'Mobile App Development',
                style: MyTextStyles.pageTitle.copyWith(
                  color: MyPallet.white,
                ),
              ),
              const SizedBox(),
            ]),
          ],
        ),
        const SizedBox(height: 48),
      ],
    );
  }
}
