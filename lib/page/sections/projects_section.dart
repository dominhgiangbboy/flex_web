import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flex_website/data/firestore_service.dart';
import 'package:flutter_flex_website/data/models.dart';
import 'package:flutter_flex_website/page/homepage.dart';
import 'package:flutter_flex_website/shared/spacing.dart';
import 'package:flutter_flex_website/styles/app_colors.dart';
import 'package:flutter_flex_website/styles/shadow.dart';
import 'package:flutter_flex_website/styles/text_styles.dart';
import 'package:flutter_flex_website/widgets/title_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProjectsSection extends StatefulWidget {
  final List<ProjectModel> projectList;
  const ProjectsSection({
    Key? key,
    required this.projectList,
  }) : super(key: key);

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  @override
  initState() {
    super.initState();
    selectedFlag = List.generate(widget.projectList.length, (index) {
      if (index == 0) {
        return true;
      } else {
        return false;
      }
    });
    currentProjectModel = widget.projectList.first;
  }

  List<bool> selectedFlag = [];

  ProjectModel currentProjectModel = ProjectModel(description: '', name: '', techStack: '', link: '', image: '', url: '');
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isMobile(context) ? null : MediaQuery.of(context).size.height,
      child: Column(children: [
        const TitleTextWidget(title: 'Projects'),
        Container(
          padding: const EdgeInsets.all(commonPadding * 2),
          child: isMobile(context)
              ? Column(
                  children: [
                    ImageSectionWidgetBox(
                      projectModel: currentProjectModel,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      child: MasonryGridView.builder(
                        itemCount: widget.projectList.length,
                        itemBuilder: (context, index) {
                          return ProjectNameWidget(
                            name: widget.projectList[index].name,
                            onTap: () {
                              setState(() {
                                currentProjectModel = widget.projectList[index];
                                selectedFlag = List.generate(widget.projectList.length, (i) {
                                  if (index == i) {
                                    return true;
                                  } else {
                                    return false;
                                  }
                                });
                              });
                            },
                            isSelected: selectedFlag[index],
                          );
                        },
                        gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: isMobile(context) ? 2 : 3,
                        ),
                      ),
                    ),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ImageSectionWidget(
                      projectModel: currentProjectModel,
                    ),
                    Expanded(
                        child: SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      child: MasonryGridView.builder(
                        itemCount: widget.projectList.length,
                        itemBuilder: (context, index) {
                          return ProjectNameWidget(
                            name: widget.projectList[index].name,
                            onTap: () {
                              setState(() {
                                currentProjectModel = widget.projectList[index];
                                selectedFlag = List.generate(widget.projectList.length, (i) {
                                  if (index == i) {
                                    return true;
                                  } else {
                                    return false;
                                  }
                                });
                              });
                            },
                            isSelected: selectedFlag[index],
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

class ImageSectionWidget extends StatelessWidget {
  final ProjectModel projectModel;
  const ImageSectionWidget({
    super.key,
    required this.projectModel,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      padding: const EdgeInsets.all(commonPadding / 2),
      child: ImageSectionWidgetBox(projectModel: projectModel),
    ));
  }
}

class ImageSectionWidgetBox extends StatelessWidget {
  const ImageSectionWidgetBox({
    super.key,
    required this.projectModel,
  });

  final ProjectModel projectModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 3,
          width: double.infinity,
          decoration: BoxDecoration(color: AppColors.background.color, boxShadow: [commonShadow]),
          child: Image.network(
            projectModel.image,
            fit: BoxFit.fitHeight,
          ),
        ),
        commonSpacing,
        Text(
          projectModel.name,
          style: AppTextStyle.titleFont,
        ),
        commonSpacing,
        Text(
          projectModel.description,
          style: AppTextStyle.subtitleFont,
        ),
        Text(
          projectModel.techStack,
          style: AppTextStyle.subtitleFont,
        ),
        Text(
          projectModel.link,
          style: AppTextStyle.subtitleFont.copyWith(decoration: TextDecoration.underline),
        ),
      ],
    );
  }
}

class ProjectNameWidget extends StatefulWidget {
  const ProjectNameWidget({
    super.key,
    required this.name,
    this.onTap,
    required this.isSelected,
  });
  final String name;
  final VoidCallback? onTap;
  final bool isSelected;
  @override
  State<ProjectNameWidget> createState() => _ProjectNameWidgetState();
}

class _ProjectNameWidgetState extends State<ProjectNameWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [commonShadow],
          color: widget.isSelected ? AppColors.primaryColor.color : AppColors.background.color,
        ),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.transparent,
          ),
          onPressed: () {
            setState(() {
              widget.onTap?.call();
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(commonPadding),
            child:
                Text(widget.name, style: AppTextStyle.titleFont.copyWith(color: widget.isSelected ? AppColors.background.color : AppColors.primaryColor.color)),
          ),
        ),
      ),
    );
  }
}
