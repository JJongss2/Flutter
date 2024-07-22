import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/notification/d_notification.dart';
import 'package:fast_app_base/screen/notification/notifications_dummy.dart';
import 'package:fast_app_base/screen/notification/w_notification_item.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( // 테마 깨지는 것을 방지
      body: CustomScrollView(
        slivers: [
          const SliverAppBar( // 고정 앱바
            backgroundColor: AppColors.veryDarkGrey,
            title: Text("알림"),
          ),
          SliverList( // 스크롤 가능한 리스트를 만드는 슬리버 위젯
              delegate: SliverChildBuilderDelegate(
            (context, index) =>
                NotificationItemWidget(notification: notificationDummies[index],
                  onTap: (){
                    NotifiactionDialog([notificationDummies[0], notificationDummies[1]]).show();
                },),
            childCount: notificationDummies.length,
          )),
        ],
      ),
    );
  }
}
