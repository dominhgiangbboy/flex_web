import 'package:flutter/material.dart';
import 'package:flutter_flex_website/page/homepage.dart';
import 'package:flutter_flex_website/styles/text_styles.dart';

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(commonPadding),
      child: Text(
        title.toUpperCase(),
        style: AppTextStyle.titleFont.copyWith(decoration: TextDecoration.underline),
      ),
    );
  }
}
