import 'package:flutter/material.dart';
import 'package:flutter_flex_website/page/homepage.dart';
import 'package:flutter_flex_website/styles/app_colors.dart';
import 'package:flutter_flex_website/styles/text_styles.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class BannerItem extends StatefulWidget {
  const BannerItem({
    super.key,
    this.isText = false,
    this.text = '',
    this.icon = '',
    required this.index,
    required this.link,
    this.scrollController,
  });
  final bool isText;
  final String text;
  final String icon;
  final int index;
  final String link;
  final ScrollController? scrollController;

  @override
  State<BannerItem> createState() => _BannerItemState();
}

class _BannerItemState extends State<BannerItem> {
  void listener() {
    setState(() {});
  }

  @override
  void initState() {
    widget.scrollController?.addListener(listener);
    super.initState();
  }

  @override
  void dispose() {
    widget.scrollController?.removeListener(listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double offsetScroll = widget.index * MediaQuery.of(context).size.height;
    final double nextOffset = (widget.index + 1) * MediaQuery.of(context).size.height;
    final double currentOffset = widget.scrollController?.offset ?? 0;
    final bool isInView = currentOffset >= offsetScroll && currentOffset < nextOffset;
    return Column(children: [
      if (widget.isText)
        TextButton(
          onPressed: () {
            widget.scrollController?.animateTo(offsetScroll, duration: const Duration(seconds: 1), curve: Curves.easeInOut);
          },
          child: Text(
            widget.text.toUpperCase(),
            style: AppTextStyle.bannerFont.copyWith(color: isInView ? AppColors.background.color : AppColors.background.color.withOpacity(0.2)),
          ),
        )
      else
        TextButton(
          style: ButtonStyle(
            splashFactory: NoSplash.splashFactory,
            backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
            overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
          ),
          onPressed: () {
            if (widget.link.isNotEmpty) {
              launchUrlString(widget.link);
            }
          },
          child: SvgPicture.asset(
            widget.icon,
            width: commonPadding * 3 / 2,
            height: commonPadding * 3 / 2,
          ),
        ),
      bannerSpacing,
    ]);
  }
}
