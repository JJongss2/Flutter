import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widget/w_height_and_width.dart';
import '../vo_stock.dart';

class StockItem extends StatelessWidget {
  final Stock stock;

  const StockItem(this.stock, {super.key,});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Image.asset(stock.stockImagePath, width: 40,),
          width20,
          (stock.stockName).text
              .size(18)
              .bold
              .make(),
          emptyExpanded,
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
            stock.todayPercentageString.text.color(stock.getPriceColor(context)).make(),
            "${stock.currentPrice.toComma()}원".text.color(context.appColors.lessImportant).make()
          ],),
        ],
      ),
    );
  }
}
