import 'package:flutter/material.dart';
import 'package:flutter_flex_website/data/mock_skill_data.dart';
import 'package:flutter_flex_website/page/homepage.dart';
import 'package:flutter_flex_website/widgets/skill_item_widget.dart';
import 'package:flutter_flex_website/widgets/title_widget.dart';

class SkillSection extends StatelessWidget {
  const SkillSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isMobile(context) ? null : MediaQuery.of(context).size.height,
      child: Column(children: [
        const TitleTextWidget(
          title: 'Skills',
        ),
        if (isMobile(context))
          Column(
            children: [
              for (var items in skillModel)
                SkillItemBoxWidget(
                  skill: items,
                ),
            ],
          )
        else
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (var items in skillModel)
                SkillItemHorizontalWidget(
                  skill: items,
                  index: skillModel.indexOf(items),
                ),
            ],
          )
      ]),
    );
  }
}
