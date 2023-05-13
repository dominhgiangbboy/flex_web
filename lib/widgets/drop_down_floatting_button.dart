import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_flex_website/page/homepage.dart';
import 'package:flutter_flex_website/styles/app_colors.dart';

class DownScrollButtonWidget extends StatefulWidget {
  const DownScrollButtonWidget({
    super.key,
    required this.scrollController,
  });
  final ScrollController scrollController;
  @override
  State<DownScrollButtonWidget> createState() => _DownScrollButtonWidgetState();
}

class _DownScrollButtonWidgetState extends State<DownScrollButtonWidget> with SingleTickerProviderStateMixin {
  final double _iconSize = 40;
  late AnimationController controller;
  int _currentIndex = 1;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      lowerBound: 0.6,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: commonPadding),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: AppColors.background.color,
                    width: 1,
                  ),
                ),
                child: MouseRegion(
                  onEnter: (event) {
                    setState(() {
                      controller.forward();
                    });
                  },
                  onExit: (event) {
                    setState(() {
                      controller.reverse();
                    });
                  },
                  child: AnimatedBuilder(
                    animation: Tween(begin: 22, end: 60).animate(
                      CurvedAnimation(
                        parent: controller,
                        curve: Curves.easeInOutSine,
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {
                        widget.scrollController.animateTo(
                          _currentIndex * MediaQuery.of(context).size.height,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOutSine,
                        );
                        _currentIndex += 1;
                      },
                      iconSize: _iconSize,
                      icon: Icon(
                        Icons.arrow_downward,
                        color: AppColors.primaryColor.color,
                      ),
                    ),
                    builder: (BuildContext context, Widget? child) {
                      return Transform.scale(
                        scale: controller.value,
                        alignment: Alignment.center,
                        child: child!,
                      );
                    },
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
