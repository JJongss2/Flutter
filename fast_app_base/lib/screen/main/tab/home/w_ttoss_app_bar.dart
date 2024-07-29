import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/notification/s_notification.dart';
import 'package:flutter/material.dart';
import "package:flutter_animate/flutter_animate.dart";

class TtossAppBar extends StatefulWidget {
  static const double appBarHeight = 60;
  const TtossAppBar({super.key});

  @override
  State<TtossAppBar> createState() => _TtossAppBarState();
}

class _TtossAppBarState extends State<TtossAppBar> {
  int _tappingCount = 0;
  bool _showRedDot = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.appColors.appBarBackground,
      height: TtossAppBar.appBarHeight,
      child: Row(
        children: [
          width10,
          AnimatedContainer(
            duration: 1000.ms,
            height: _tappingCount > 2? 60:30,
            child: Image.asset(
              "$basePath/icon/toss.png",
            ),
          ),

          AnimatedCrossFade(
              firstChild: Image.asset(
          "$basePath/icon/toss.png"),
              secondChild: Image.asset(
          "$basePath/icon/map_point.png"),
              crossFadeState:
              _tappingCount < 2 ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              duration: 1500.ms
          ),
          emptyExpanded,
          _tappingCount.text.make(),
          Tap(
            onTap: (){
              setState(() {
                _tappingCount++;
              });
            },
            child: Image.asset(
              "$basePath/icon/map_point.png",
              height: 30,
            ),
          ),
          width10,
          Tap(
            onTap: (){
              // 알림 화면
              Nav.push(NotificationScreen()); // 새로운 화면이 나오니 push
            },
            child: Stack(
              children: [
                Image.asset(
                  "$basePath/icon/notification.png",
                  height: 30,
                ),
                if(_showRedDot)Positioned.fill(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 7,
                      height: 7,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red),
                    ),
                  ),
                )
              ],
            ).animate().shake(duration: 2000.ms, hz: 3).then().fadeOut(duration: 1000.ms),
          ),
          width10,
        ],
      ),
    );
  }
}
