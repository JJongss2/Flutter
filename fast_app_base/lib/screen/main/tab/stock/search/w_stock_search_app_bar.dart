import 'package:fast_app_base/common/util/app_keyboard_util.dart';
import 'package:fast_app_base/common/widget/w_text_field_with_delete.dart';
import 'package:flutter/material.dart';

import '../../../../../common/common.dart';
import '../../../../../common/widget/w_arrow.dart';
import '../../../../../common/widget/w_tap.dart';

class StockSearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const StockSearchAppBar({required this.controller, super.key});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea( // 상단창까지 침범함
      child: SizedBox(
        height: kToolbarHeight,
        child: Row(
          children: [
            Tap(onTap: () => Nav.pop(context), child: const SizedBox(
                width: 56,
                height: kToolbarHeight,
                child: Arrow(direction: AxisDirection.left,))),
            Expanded(child: TextFieldWithDelete(
                controller: controller,
                texthint: "'커피'를 검색해보세요.",
              onEditingComplete: (){
                  debugPrint('검색 확인버튼');
                  AppKeyboardUtil.hide(context); // 검색 버튼을 누르고 키보드를 닫을 수 있음
              },
              textInputAction: TextInputAction.search,  // 키보드 엔터버튼대신 검색버튼이 생김
            ).pOnly(top: 6)), // TextField 는 controller가 필요함
            width20,
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
