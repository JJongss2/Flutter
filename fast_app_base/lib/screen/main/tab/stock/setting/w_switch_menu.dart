import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/stock/setting/w_os_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchMenu extends StatelessWidget {
  final String title;
  final bool isOn;

  // 버튼을 누를 시 누른 이벤트를 상위 위젯에 전달해야하기 때문에
  final ValueChanged<bool> onTap; // ValueChanged<bool> == Function 을 의미함

  const SwitchMenu(this.title, this.isOn,{super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        title.text.bold.make(),
        emptyExpanded,
        OsSwitch(value : isOn, onChanged: onTap)
      ],
    ).p20();
  }
}
