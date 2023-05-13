import 'package:flutter/material.dart';
import 'package:flutter_flex_website/styles/app_colors.dart';
import 'package:flutter_flex_website/styles/text_styles.dart';
import 'package:flutter_flex_website/widgets/banner_main_widget.dart';

import '../page/homepage.dart';

class WelcomeScreenWidgetBody extends StatelessWidget {
  const WelcomeScreenWidgetBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        bannerSpacing,
        const BannerMainWidget(),
        heightSpace,
      ],
    );
  }
}
