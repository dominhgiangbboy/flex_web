import 'package:flutter/material.dart';
import 'package:flutter_flex_website/page/homepage.dart';
import 'package:flutter_flex_website/styles/app_colors.dart';
import 'package:flutter_flex_website/styles/border.dart';
import 'package:flutter_flex_website/styles/shadow.dart';

import '../styles/text_styles.dart';

class BannerMainWidget extends StatelessWidget {
  const BannerMainWidget({super.key});

  static double _fullWidth(context) => isMobile(context) ? MediaQuery.of(context).size.width / 6 * 5 : MediaQuery.of(context).size.width / 2;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.background.color,
        border: commonBorder,
        boxShadow: [commonShadow],
      ),
      padding: const EdgeInsets.all(commonPadding),
      width: _fullWidth(context),
      child: Column(
        children: [
          Text(
            "Hello\n My name is giang and i'm a".toUpperCase(),
            style: AppTextStyle.titleFont,
            textAlign: TextAlign.center,
          ),
          heightSpace,
          heightSpace,
          HoverableSoftwareTextWidget(),
          heightSpace,
          Text(
            'I love bringing ideas to life with code',
            style: AppTextStyle.subtitleFont,
            textAlign: TextAlign.center,
          ),
          bannerSpacing,
          ButtonContactWidget(),
          heightSpace,
        ],
      ),
    );
  }
}

class HoverableSoftwareTextWidget extends StatefulWidget {
  const HoverableSoftwareTextWidget({
    super.key,
  });

  @override
  State<HoverableSoftwareTextWidget> createState() => _HoverableSoftwareTextWidgetState();
}

class _HoverableSoftwareTextWidgetState extends State<HoverableSoftwareTextWidget> {
  bool _isHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          _isHover = true;
        });
      },
      onExit: (event) {
        setState(() {
          _isHover = false;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: commonBorder,
          color: _isHover ? AppColors.primaryColor.color : AppColors.background.color,
        ),
        width: double.infinity,
        padding: const EdgeInsets.all(buttonPadding),
        child: Text(
          '< software engineer >'.toUpperCase(),
          style: AppTextStyle.highlightTitleFont.copyWith(color: _isHover ? AppColors.background.color : AppColors.primaryColor.color),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class ButtonContactWidget extends StatefulWidget {
  const ButtonContactWidget({
    super.key,
  });

  @override
  State<ButtonContactWidget> createState() => _ButtonContactWidgetState();
}

class _ButtonContactWidgetState extends State<ButtonContactWidget> {
  bool _isHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          _isHover = true;
        });
      },
      onExit: (event) {
        setState(() {
          _isHover = false;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: _isHover ? AppColors.primaryColor.color : AppColors.background.color,
          border: commonBorder,
        ),
        width: 200,
        padding: const EdgeInsets.all(buttonPadding),
        child: TextButton(
            onPressed: () {},
            child: Text('Contact me', style: AppTextStyle.buttonFont.copyWith(color: _isHover ? AppColors.background.color : AppColors.primaryColor.color))),
      ),
    );
  }
}
