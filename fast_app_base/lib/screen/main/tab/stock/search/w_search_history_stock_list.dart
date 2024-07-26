import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/s_stock_detail.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/search_stock_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class SearchHistoryList extends StatefulWidget {
  const SearchHistoryList({super.key});

  @override
  State<SearchHistoryList> createState() {
    return _SearchHistoryListState();
  }
}

class _SearchHistoryListState extends State<SearchHistoryList>
    with SearchStockDataProvider {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 65,
      child: Obx(
        () => ListView.builder(
          padding: const EdgeInsets.only(top: 5),
          // list가 받을 때 마다 갱신해야하기 때문에 Obx 안에 넣어야 함
          scrollDirection: Axis.horizontal,
          itemCount: searchData.searchHistoryList.length,
          itemBuilder: (context, index) {
            final stockName = searchData.searchHistoryList[index];
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 8),
                  child: Row(
                    children: [
                      Tap(
                          onTap: () {
                            Nav.push(StockDetailScreen(stockName));
                          },
                          child:
                              searchData.searchHistoryList[index].text.make()),
                      width5,
                      Tap(
                          onTap: (){
                            searchData.removeHistory(stockName);
                            },
                          child: Icon(Icons.close)),
                    ],
                  )
                      .box
                      .withRounded(value: 6)
                      .color(context.appColors.roundedLayoutBackground)
                      .p8
                      .make(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
