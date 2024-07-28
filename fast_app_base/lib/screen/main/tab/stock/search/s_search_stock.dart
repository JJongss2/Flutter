import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/search_stock_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'w_popular_search_stock_list.dart';
import 'w_search_auto_complete_list.dart';
import 'w_search_history_stock_list.dart';
import 'w_stock_search_app_bar.dart';

class SearchStockScreen extends StatefulWidget {
  const SearchStockScreen({super.key});

  @override
  State<SearchStockScreen> createState() => _SearchStockScreenState();
}

class _SearchStockScreenState extends State<SearchStockScreen> with SearchStockDataProvider {
  final controller = TextEditingController();

  @override
  void initState() { //initState 는 생성자가 생성될 때 호출되는 것이 아님
    Get.put(SearchStockData());
    controller.addListener((){
      searchData.search(controller.text);
    });
    super.initState();
  }
  @override
  void dispose() {
    Get.delete<SearchStockData>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StockSearchAppBar(controller : controller),
      body: Obx(()=> searchData.autoCompleteList.isEmpty ?
        ListView(
          children: const [
            SearchHistoryList(),
            PopularSearchList(),
          ],
        ) :
            SearchAutoCompleteList(controller),
      )
      ,
    ); // 키보드 크기에 맞게끔 화면 설정됨
  }
}
