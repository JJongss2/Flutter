import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/notification/notifications_dummy.dart';
import 'package:flutter/material.dart';
import './vo/vo_notification.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationItemWidget extends StatefulWidget {
  final TtossNotification notification;
  final VoidCallback onTap;

  const NotificationItemWidget({required this.onTap, super.key, required this.notification});

  @override
  State<NotificationItemWidget> createState() => _NotificationItemWidgetState();
}

class _NotificationItemWidgetState extends State<NotificationItemWidget> {
  static const iconWidth = 25.0; // .0 을 붙여서 double type 변환
  static const leftPadding = 10.0;

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Tap(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        color: widget.notification.isRead
            ? AppColors.veryDarkGrey
            : context.appColors.unReadColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Width(leftPadding),
                Image.asset(
                  widget.notification.type.iconPath,
                  width: iconWidth,
                ),
                widget.notification.type.name.text
                    .size(12)
                    .color(context.appColors.lessImportantText)
                    .make(),
                emptyExpanded,
                timeago
                    .format(widget.notification.time, locale: context.locale.languageCode)
                    .text
                    .size(13)
                    .color(context.appColors.lessImportantText)
                    .make(),
                width10,
              ],
            ),
            widget.notification.description.text
                .make()
                .pOnly(left: iconWidth + leftPadding)
          ],
        ),
      ),
    );
  }
}
