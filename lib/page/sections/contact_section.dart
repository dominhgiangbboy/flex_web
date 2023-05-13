import 'package:flutter/material.dart';
import 'package:flutter_flex_website/page/homepage.dart';
import 'package:flutter_flex_website/page/sections/skills_section.dart';
import 'package:flutter_flex_website/styles/app_colors.dart';
import 'package:flutter_flex_website/styles/border.dart';
import 'package:flutter_flex_website/styles/shadow.dart';
import 'package:flutter_flex_website/styles/text_styles.dart';
import 'package:flutter_flex_website/widgets/banner_page_widget.dart';
import 'package:flutter_flex_website/widgets/title_widget.dart';
import 'package:flutter_svg/svg.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.all(commonPadding * 2),
        child: Column(children: [
          TitleTextWidget(title: 'Contact'),
          Text(
            'Leave me a message!',
            style: AppTextStyle.subtitleFont,
          ),
          bannerSpacing,
          Container(
            padding: const EdgeInsets.all(commonPadding),
            decoration: BoxDecoration(
              boxShadow: [commonShadow],
              color: Colors.white,
            ),
            child: TextField(
              controller: TextEditingController(),
              maxLines: null,
              focusNode: FocusNode(),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Please put your message here!',
                hintStyle: AppTextStyle.subtitleFont.copyWith(color: AppColors.primaryColor.color.withOpacity(0.6)),
              ),
              style: AppTextStyle.subtitleFont,
              cursorColor: AppColors.primaryColor.color,
            ),
          ),
          commonSpacing,
          commonSpacing,
          Container(
            padding: const EdgeInsets.all(commonPadding),
            decoration: BoxDecoration(
              color: Colors.white,
              border: commonBorder,
            ),
            width: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  telegramIconLink,
                  height: 16,
                  colorFilter: ColorFilter.mode(AppColors.primaryColor.color, BlendMode.srcIn),
                ),
                SizedBox(
                  width: commonPadding,
                ),
                Text(
                  'Send',
                  style: AppTextStyle.buttonFont.copyWith(color: AppColors.primaryColor.color),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
