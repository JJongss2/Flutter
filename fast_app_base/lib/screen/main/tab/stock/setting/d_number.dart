import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_round_button.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:flutter/material.dart';
import 'package:nav/dialog/dialog.dart';
import 'package:nav/enum/enum_nav_ani.dart';

import '../../../../../common/constant/app_colors.dart';
import '../../../../notification/w_notification_item.dart';

class NumberDialog extends DialogWidget<int?> {
  NumberDialog(
      {super.key,
      super.animation = NavAni.Fade,
      super.barrierDismissible = false});

  @override
  State<NumberDialog> createState() => _NotificationDialogState();
}

class _NotificationDialogState extends DialogState<NumberDialog> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency, // 화면을 투명하게 해줌
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RoundedContainer(
            child: Column(
              children: [
                '숫자를 입력해주세요'.text.make(),
                TextField(
                  controller: controller, keyboardType: TextInputType.number, // 키보드 입력 타입이 숫자만 가능
                ),
                RoundButton(text: '완료', onTap: (){
                  final text = controller.text;
                  int number = int.parse(text);
                  widget.hide(number); // 받는 쪽에 number를 넘김
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}
