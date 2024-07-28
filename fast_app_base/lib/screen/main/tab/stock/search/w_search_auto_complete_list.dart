import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/s_stock_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'search_stock_data.dart';

class SearchAutoCompleteList extends StatelessWidget
    with SearchStockDataProvider {

  final TextEditingController controller;
  SearchAutoCompleteList(this.controller, {super.key}); // const가 없어야함 late는 생성될때가 아니기 때문에

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final stock = searchData.autoCompleteList[index];
        final stockName = stock.name;
        return Tap(
          onTap: () {
            controller.clear();
            searchData.addHistory(stock);
            Nav.push(StockDetailScreen(stockName: stockName));
          },
          child: stockName.text.make().p(20),
        );
      },
      itemCount: searchData.autoCompleteList.length,
    );
  }
}
