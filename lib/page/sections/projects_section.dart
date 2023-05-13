import 'package:flutter/material.dart';
import 'package:flutter_flex_website/page/homepage.dart';
import 'package:flutter_flex_website/page/sections/skills_section.dart';
import 'package:flutter_flex_website/styles/app_colors.dart';
import 'package:flutter_flex_website/styles/shadow.dart';
import 'package:flutter_flex_website/styles/text_styles.dart';
import 'package:flutter_flex_website/widgets/title_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(children: [
        TitleTextWidget(title: 'Projects'),
        Container(
          padding: const EdgeInsets.all(commonPadding * 2),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Container(
                padding: const EdgeInsets.all(commonPadding / 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 3,
                      decoration: BoxDecoration(color: AppColors.background.color, boxShadow: [commonShadow]),
                    ),
                    commonSpacing,
                    Text(
                      'Project 1',
                      style: AppTextStyle.titleFont,
                    ),
                    commonSpacing,
                    Text(
                      'Description',
                      style: AppTextStyle.subtitleFont,
                    ),
                    Text(
                      'Tech Stack',
                      style: AppTextStyle.subtitleFont,
                    ),
                    Text(
                      'Link',
                      style: AppTextStyle.subtitleFont.copyWith(decoration: TextDecoration.underline),
                    ),
                  ],
                ),
              )),
              Expanded(
                  child: SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                child: MasonryGridView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          boxShadow: [commonShadow],
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                  gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                ),
              ))
            ],
          ),
        )
      ]),
    );
  }
}
