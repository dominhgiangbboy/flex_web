import 'package:flutter/material.dart';
import 'package:flutter_flex_website/styles/app_colors.dart';
import 'package:flutter_flex_website/widgets/banner_item_widget.dart';

const textListDefault = [
  {'name': 'about', 'index': 0},
  {'name': 'skills', 'index': 1},
  {'name': 'projects', 'index': 2},
  {'name': 'contact', 'index': 3},
];

const String githubIconLink = 'icons/ic_github.svg';
const String linkedinIconLink = 'icons/ic_linkedin.svg';
const String telegramIconLink = 'icons/ic_telegram.svg';
const iconListDefault = [
  {'icon': githubIconLink, 'link': 'https://github.com/dominhgiangbboy'},
  {'icon': linkedinIconLink, 'link': 'https://www.linkedin.com/in/giang-%C4%91%E1%BB%97-minh-9174251a2/'},
  {'icon': telegramIconLink, 'link': 'mailto:dominhgianga5nc@gmail.com'},
];

class BannerDesktopWidget extends StatelessWidget {
  final bool isText;
  final ScrollController? scrollController;
  final List<Map<String, dynamic>> textList;
  final List<Map<String, dynamic>> iconList;
  const BannerDesktopWidget.left({super.key, this.isText = false, this.textList = const [], this.iconList = iconListDefault, this.scrollController});
  const BannerDesktopWidget.right({super.key, this.isText = true, this.textList = textListDefault, this.iconList = const [], this.scrollController});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor.color,
      width: 200,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: isText ? CrossAxisAlignment.end : CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: isText
              ? textList
                  .map((text) => BannerItem(
                        isText: isText,
                        text: text['name'],
                        index: text['index'],
                        link: '',
                        scrollController: scrollController,
                      ))
                  .toList()
              : iconList
                  .map((icon) => BannerItem(
                        isText: isText,
                        icon: icon['icon'],
                        index: 0,
                        link: icon['link'],
                      ))
                  .toList(),
        ),
      ),
    );
  }
}
