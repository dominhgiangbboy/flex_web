import 'package:flutter/material.dart';
import 'package:flutter_flex_website/widgets/banner_main_widget.dart';

import '../page/homepage.dart';

class WelcomeScreenWidgetBody extends StatelessWidget {
  const WelcomeScreenWidgetBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        bannerSpacing,
        BannerMainWidget(),
        heightSpace,
      ],
    );
  }
}
