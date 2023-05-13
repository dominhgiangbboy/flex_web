import 'package:flutter/material.dart';
import 'package:flutter_flex_website/widgets/detailpage.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: const WelcomeScreenWidgetBody(),
    );
  }
}
