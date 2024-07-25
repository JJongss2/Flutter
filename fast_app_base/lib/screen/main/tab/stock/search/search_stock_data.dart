import 'package:fast_app_base/common/util/local_json.dart';
import 'package:fast_app_base/screen/main/tab/stock/vo_simple_stock.dart';
import 'package:get/get.dart';

class SearchStockData extends GetxController{
  List<SimpleStock> stocks = [];
  RxList<String> searchHistoryList = <String>[].obs; // 검색기록
  RxList<SimpleStock> autoCompleteList = <SimpleStock>[].obs; // 자동완성

  @override
  void onInit() {   // GetxController 가 최초 생성될 때 호출이 되는 함수
    searchHistoryList.addAll(['삼성전자', 'LG전자', '현대차', '넷플릭스']);
    loadLocalStockJson();

    super.onInit();
  }

  Future<void> loadLocalStockJson() async{
    final jsonList = await LocalJson.getObjectList<SimpleStock>('stock_list.json');  // getObjectList json 파일을 불러오는 함수
    stocks.addAll(jsonList);

  }

}