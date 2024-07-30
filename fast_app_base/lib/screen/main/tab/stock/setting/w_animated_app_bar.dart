import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../common/widget/w_arrow.dart';

class AnimatedAppBar extends StatefulWidget {
  Duration get duration => 10.ms;
  final String title;
  final ScrollController controller;
  const AnimatedAppBar(this.title,
      {
        super.key,
        required this.controller
      });

  @override
  State<AnimatedAppBar> createState() => _AnimatedAppBarState();
}


class _AnimatedAppBarState extends State<AnimatedAppBar> {
  Duration duration = 100.ms;
  double scrollPosition = 0;

  bool get isTriggered => scrollPosition > 80;
  bool get isNotTriggered => !isTriggered;

  double getValue(double initial, double target){
    if(isTriggered){
      return target;
    }
    double fraction = scrollPosition/80;
    return initial + (target - initial) *fraction;
  }
  @override
  void initState() {
    widget.controller.addListener((){
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
            Tap(onTap: (){
              Nav.pop(context);
            }, child: Arrow(
              direction : AxisDirection.left
            )).p20(),
            AnimatedContainer(
              duration: duration,
              padding: EdgeInsets.only(left: getValue(20, 50), top: getValue(50, 15)),
              child: AnimatedDefaultTextStyle(
                duration: duration,
                style: TextStyle(fontSize: getValue(30, 18), fontWeight: FontWeight.bold),
                child: widget.title.text.make(),
              )
            ),
          ],
        ),
      ),
    );
  }
}
