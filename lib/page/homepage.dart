import 'package:flutter/material.dart';
import 'package:flutter_flex_website/page/sections/contact_section.dart';
import 'package:flutter_flex_website/page/sections/projects_section.dart';
import 'package:flutter_flex_website/page/sections/skills_section.dart';
import 'package:flutter_flex_website/page/sections/welcome_section.dart';
import 'package:flutter_flex_website/styles/app_colors.dart';
import 'package:flutter_flex_website/widgets/banner_page_widget.dart';
import 'package:flutter_flex_website/widgets/drop_down_floatting_button.dart';

const SizedBox heightSpace = SizedBox(height: 16);
const SizedBox bannerSpacing = SizedBox(height: 80);

isMobile(BuildContext context) => MediaQuery.of(context).size.width < 800;

class HomePage extends StatelessWidget {
  HomePage({super.key});

  static double fullWidth(BuildContext context) => MediaQuery.of(context).size.width;
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Đỗ Minh Giang',
        home: Scaffold(
          body: Stack(children: [
            Row(
              children: [
                if (!isMobile(context)) const BannerDesktopWidget.left(),
                Expanded(
                  child: Scaffold(
                    appBar: isMobile(context)
                        ? AppBar(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            actions: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.menu,
                                    size: iconSize,
                                    color: AppColors.primaryColor.color,
                                  ))
                            ],
                          )
                        : null,
                    body: SizedBox(
                      width: fullWidth(context),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: const Column(
                          children: [
                            WelcomeSection(),
                            SkillSection(),
                            ProjectsSection(),
                            ContactSection(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                if (!isMobile(context))
                  BannerDesktopWidget.right(
                    scrollController: scrollController,
                  ),
              ],
            ),
            DownScrollButtonWidget(
              scrollController: scrollController,
            )
          ]),
        ));
  }
}

const double iconSize = 40;
const double commonPadding = 16;
const double buttonPadding = 8;
