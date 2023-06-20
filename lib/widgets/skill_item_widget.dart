import 'package:flutter/material.dart';
import 'package:flutter_flex_website/data/models.dart';
import 'package:flutter_flex_website/page/homepage.dart';
import 'package:flutter_flex_website/shared/spacing.dart';
import 'package:flutter_flex_website/styles/app_colors.dart';
import 'package:flutter_flex_website/styles/shadow.dart';
import 'package:flutter_flex_website/styles/text_styles.dart';

class SkillItemHorizontalWidget extends StatelessWidget {
  final int index;
  final SkillModel skill;

  const SkillItemHorizontalWidget({
    super.key,
    required this.index,
    required this.skill,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 160.0 * index),
          child: SkillItemBoxWidget(skill: skill),
        ),
      ),
    );
  }
}

class SkillItemBoxWidget extends StatelessWidget {
  const SkillItemBoxWidget({
    super.key,
    required this.skill,
  });

  final SkillModel skill;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(commonPadding),
      decoration: BoxDecoration(
        boxShadow: [commonShadow],
        color: AppColors.background.color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Mobile development',
                style: AppTextStyle.titleFont.copyWith(fontWeight: FontWeight.w500, fontSize: 16),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          commonSpacing,
          for (var skillItem in skill.items)
            SkillItemCellWidget(
              skillItem: skillItem,
            )
        ],
      ),
    );
  }
}

class SkillItemCellWidget extends StatefulWidget {
  final SkillItemModel skillItem;
  const SkillItemCellWidget({
    super.key,
    required this.skillItem,
  });

  @override
  State<SkillItemCellWidget> createState() => _SkillItemCellWidgetState();
}

class _SkillItemCellWidgetState extends State<SkillItemCellWidget> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(commonPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    widget.skillItem.name,
                    style: AppTextStyle.subtitleFont.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (isExpanded)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        widget.skillItem.description,
                        style: AppTextStyle.subtitleFont,
                      ),
                    )
                ],
              ),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              color: AppColors.primaryColor.color,
              onPressed: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              icon: Icon(
                isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
              ),
            )
          ],
        ));
  }
}
