import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widget/w_arrow.dart';

class AnimatedAppBar extends StatefulWidget {
  Duration get duration => 10.ms;
  final String title;
  final ScrollController controller;
  final AnimationController animationController;

  const AnimatedAppBar(
    this.title, {
    super.key,
    required this.controller,
    required this.animationController,
  });

  @override
  State<AnimatedAppBar> createState() => _AnimatedAppBarState();
}

class _AnimatedAppBarState extends State<AnimatedAppBar> {
  Duration duration = 100.ms;
  double scrollPosition = 0;
  late CurvedAnimation animation =
      CurvedAnimation(parent: widget.animationController, curve: Curves.bounceInOut);

  bool get isTriggered => scrollPosition > 80;

  bool get isNotTriggered => !isTriggered;

  double getValue(double initial, double target) {
    if (isTriggered) {
      return target;
    }
    double fraction = scrollPosition / 80;
    return initial + (target - initial) * fraction;
  }

  @override
  void initState() {

    widget.animationController.addListener((){
      setState(() { // 애니메이션 티커가 실행됨

      });
    });
    widget.controller.addListener(() {
      setState(() {
        scrollPosition = widget.controller.position.pixels;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.veryDarkGrey,
      child: SafeArea(
        child: Stack(
          children: [
            Tap(
                    onTap: () {
                      Nav.pop(context);
                    },
                    child: Arrow(direction: AxisDirection.left))
                .p20(),
            Positioned(
              left: animation.value * 200,
              child: TweenAnimationBuilder<Color?>(
                duration: 1000.ms,
                tween: ColorTween(
                    begin: Colors.green,
                    end: isTriggered ? Colors.orange : Colors.green),
                builder: (context, value, child) => ColorFiltered(
                    colorFilter: ColorFilter.mode(
                        value ?? Colors.green, BlendMode.modulate),
                    child: child),
                child: Image.asset(
                  "$basePath/icon/map_point.png",
                  height: 60,
                  colorBlendMode: BlendMode.modulate, // 이미지에 색상을 입힘
                ),
              ),
            ),
            AnimatedContainer(
                duration: duration,
                padding: EdgeInsets.only(
                    left: getValue(20, 50), top: getValue(50, 15)),
                child: AnimatedDefaultTextStyle(
                  duration: duration,
                  style: TextStyle(
                      fontSize: getValue(30, 18), fontWeight: FontWeight.bold),
                  child: widget.title.text.make(),
                )),
          ],
        ),
      ),
    );
  }
}
