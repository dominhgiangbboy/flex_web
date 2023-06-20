import 'package:flutter/material.dart';
import 'package:flutter_flex_website/data/firestore_service.dart';
import 'package:flutter_flex_website/data/models.dart';
import 'package:flutter_flex_website/page/sections/contact_section.dart';
import 'package:flutter_flex_website/page/sections/projects_section.dart';
import 'package:flutter_flex_website/page/sections/skills_section.dart';
import 'package:flutter_flex_website/page/sections/welcome_section.dart';
import 'package:flutter_flex_website/styles/app_colors.dart';
import 'package:flutter_flex_website/styles/text_styles.dart';
import 'package:flutter_flex_website/widgets/banner_page_widget.dart';
import 'package:flutter_flex_website/widgets/drop_down_floatting_button.dart';

const SizedBox heightSpace = SizedBox(height: 16);
const SizedBox bannerSpacing = SizedBox(height: 80);

isMobile(BuildContext context) => MediaQuery.of(context).size.width < 800;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static double fullWidth(BuildContext context) => MediaQuery.of(context).size.width;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController scrollController = ScrollController();
  bool showOverlay = false;
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
                    body: SizedBox(
                      width: HomePage.fullWidth(context),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          children: [
                            const WelcomeSection(),
                            const SkillSection(),
                            FutureBuilder<List<ProjectModel>>(
                                future: FirestoreService.instance.getProjectData(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasError) {
                                    return const Text('Something went wrong');
                                  }
                                  if (snapshot.connectionState == ConnectionState.waiting) {
                                    return const CircularProgressIndicator(
                                      color: Colors.black,
                                    );
                                  }
                                  if (snapshot.hasData) {
                                    return ProjectsSection(
                                      projectList: snapshot.data ?? [],
                                    );
                                  } else {
                                    return Text('No project found :(');
                                  }
                                }),
                            const ContactSection(),
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
            if (isMobile(context))
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(commonPadding),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        showOverlay = !showOverlay;
                      });
                    },
                    icon: const Icon(
                      Icons.menu,
                      size: 42,
                    ),
                  ),
                ),
              ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              transformAlignment: Alignment.center,
              curve: Curves.easeInOut,
              height: MediaQuery.of(context).size.height,
              width: showOverlay ? MediaQuery.of(context).size.width : 0,
              color: AppColors.background.color,
              child: showOverlay
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TabbarItemWidget(
                          showOverlay: showOverlay,
                          text: 'About',
                          index: 1,
                        )
                      ],
                    )
                  : null,
            ),
            if (!showOverlay)
              DownScrollButtonWidget(
                scrollController: scrollController,
              )
            else
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(commonPadding * 2),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        showOverlay = !showOverlay;
                      });
                    },
                    icon: Icon(
                      Icons.cancel_outlined,
                      size: 32,
                      color: AppColors.primaryColor.color,
                    ),
                  ),
                ),
              ),
          ]),
        ));
  }
}

class TabbarItemWidget extends StatefulWidget {
  const TabbarItemWidget({
    super.key,
    required this.showOverlay,
    required this.text,
    required this.index,
  });
  final int index;
  final bool showOverlay;
  final String text;

  @override
  State<TabbarItemWidget> createState() => _TabbarItemWidgetState();
}

class _TabbarItemWidgetState extends State<TabbarItemWidget> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primaryColor.color,
        padding: EdgeInsets.zero,
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        height: 60,
        width: widget.showOverlay ? MediaQuery.of(context).size.width : 0,
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: AppColors.primaryColor.color))),
        child: Center(
          child: Text(
            widget.text,
            style: AppTextStyle.titleFont,
          ),
        ),
      ),
    );
  }
}

const double iconSize = 40;
const double commonPadding = 16;
const double buttonPadding = 8;
