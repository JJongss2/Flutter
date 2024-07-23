import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';

import '../../../../common/widget/w_arrow.dart';

class PointButton extends StatelessWidget { // 내 포인트 정보

  final int point;
  const PointButton({super.key, required this.point});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        "내 포인트".text.color(context.appColors.lessImportant).make(),
        emptyExpanded,
        "$point 원".text.bold.make(),
        width10,
        Arrow(color : context.appColors.lessImportant),  // 우측으로 향하는 arrow 버튼
      ],
    );
  }
}

