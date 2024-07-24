import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_arrow.dart';
import 'package:fast_app_base/common/widget/w_long_button.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:fast_app_base/screen/main/tab/stock/tab/w_interest_stock_list.dart';
import 'package:flutter/material.dart';

class MyStockFragment extends StatelessWidget {
  const MyStockFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      getMyAccount(context), height20, getMyStocks(context),
    ],);
  }

  Widget getMyAccount(BuildContext context) => Container( // 함수로 만들어줌 context를 사용하기 위해
    padding: const EdgeInsets.symmetric(horizontal: 20),
    color: context.appColors.roundedLayoutBackground,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        height30,
        '계좌'.text.bold.make(),
        Row(
          children: [
            '443원'.text.size(24).bold.make(),
            Arrow(),
            emptyExpanded,
            RoundedContainer(
              radius: 6,
              child: '채우기'.text.size(12).make(),
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
              backgroundColor: context.appColors.buttonBackground,
            ),
          ],
        ),
        height30,
        Line(color: context.appColors.divider,),
        height10,
        LongButton(title: '주문내역'),
        LongButton(title: '판매내역'),
      ],
    ),
  );

  Widget getMyStocks(BuildContext context) => Column(
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: context.appColors.roundedLayoutBackground,
        child: Column(
          children: [
            height30,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                '관심주식'.text.bold.size(18).make(),
                '편집하기'.text.color(context.appColors.lessImportant).make(),
              ],
            ),
            height20,
            Tap(
              onTap: (){
                context.showSnackbar('기본');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  '기본'.text.make(),
                  Arrow(
                    direction: AxisDirection.up,
                  )
                ],
              ),
            ),
            height20,
          ],
        ),
      ),
      InterestStockList().pSymmetric(h: 20),
    ],
  );

}
