import 'package:animations/animations.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/datetime_extension.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/popular_stock_dummy.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/s_stock_detail.dart';
import 'package:flutter/material.dart';

class PopularSearchList extends StatefulWidget {
  const PopularSearchList({Key? key}) : super(key: key);

  @override
  State<PopularSearchList> createState() => _PopularSearchListState();
}

class _PopularSearchListState extends State<PopularSearchList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            '인기 검색'.text.bold.white.size(16).make(),
            emptyExpanded,
            '오늘 ${DateTime.now().formattedTime} 기준'.text.white.size(12).make(),
          ],
        ).pSymmetric(h: 20, v: 15),
        height20,
        ...popularStockList
            .mapIndexed((e, index) => OpenContainer<bool>(
          closedColor: Colors.transparent,
          openColor: Colors.transparent,
          transitionType: ContainerTransitionType.fade,
          openBuilder: (context, closeFunction) => StockDetailScreen(stockName: e.name),
          closedBuilder: (context, openFunction) {
            return Row(
              children: [
                (index + 1).text.bold.white.size(16).make(),
                width20,
                e.name.text.bold.white.size(16).make(),
                emptyExpanded,
                e.todayPercentageString.text
                    .color(e.getPriceColor(context))
                    .size(16)
                    .make(),
              ],
            ).pSymmetric(h: 20, v: 20);
          },
        ))
            .toList()
      ],
    );
  }
}







// import 'package:fast_app_base/common/common.dart';
// import 'package:fast_app_base/common/dart/extension/datetime_extension.dart';
// import 'package:fast_app_base/screen/main/tab/stock/search/popular_stock_dummy.dart';
// import 'package:fast_app_base/screen/main/tab/stock/search/w_popular_stock_item.dart';
// import 'package:flutter/material.dart';
//
// class PopularSearchStockList extends StatelessWidget {
//   const PopularSearchStockList({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(children: [
//           '인기 검색'.text.bold.size(18).make(),
//           EmptyExpanded(),
//           '오늘 ${DateTime.now().formattedTime} 기준'.text.color(context.appColors.lessImportant).make()
//         ],),
//         height20,
//
//         ...popularStockList.mapIndexed((element, index) => PopularStockItem(stock: element, number: index+1)).toList()
//
//       ],
//     ).pSymmetric(h: 20);
//   }
// }
