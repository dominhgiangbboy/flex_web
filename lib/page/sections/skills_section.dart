import 'package:flutter/material.dart';
import 'package:flutter_flex_website/page/homepage.dart';
import 'package:flutter_flex_website/styles/app_colors.dart';
import 'package:flutter_flex_website/styles/border.dart';
import 'package:flutter_flex_website/styles/shadow.dart';
import 'package:flutter_flex_website/styles/text_styles.dart';
import 'package:flutter_flex_website/widgets/title_widget.dart';

class SkillSection extends StatelessWidget {
  const SkillSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(children: [
        TitleTextWidget(
          title: 'Skills',
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SkillItemHorizontalWidget(
              index: 1,
            ),
            SkillItemHorizontalWidget(
              index: 0,
            ),
            SkillItemHorizontalWidget(
              index: 2,
            )
          ],
        )
      ]),
    );
  }
}

const SizedBox commonSpacing = SizedBox(height: 16);

class SkillItemHorizontalWidget extends StatelessWidget {
  final int index;
  const SkillItemHorizontalWidget({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 32,
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 120.0 * index),
          child: Container(
            padding: const EdgeInsets.all(commonPadding),
            decoration: BoxDecoration(
              boxShadow: [commonShadow],
              color: AppColors.background.color,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Mobile development',
                  style: AppTextStyle.subtitleFont.copyWith(fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                commonSpacing,
                SkillItemCellWidget(),
                SkillItemCellWidget(),
                SkillItemCellWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SkillItemCellWidget extends StatelessWidget {
  const SkillItemCellWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(commonPadding),
        child: RichText(
          text: TextSpan(children: [
            TextSpan(text: 'Flutter', style: AppTextStyle.subtitleFont.copyWith(fontWeight: FontWeight.w600)),
          ]),
        ));
  }
}
