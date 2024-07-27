import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/notification/vo/vo_notification.dart';
import 'package:fast_app_base/screen/notification/w_notification_item.dart';
import 'package:flutter/material.dart';
import 'package:nav/dialog/dialog.dart';

import '../../common/constant/app_colors.dart';

class NotificationDialog extends DialogWidget {

  final List<TtossNotification> notifications;
  NotificationDialog(this.notifications, {super.key, super.animation = NavAni.Bottom }); // 밑에 애니메이션이 나옴

  @override
  State<NotificationDialog> createState() => _NotificationDialogState();
}

class _NotificationDialogState extends DialogState<NotificationDialog> {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency, // 화면을 투명하게 해줌
      color: AppColors.veryDarkGrey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
        ...widget.notifications.
        map((element) => NotificationItemWidget(onTap: (){
          widget.hide();
          }, notification: element)
        ).toList()
      
      ],),
    );
  }
}
