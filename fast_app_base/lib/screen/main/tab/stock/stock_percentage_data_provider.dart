import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

abstract mixin class StockPercentageDataProvider{

  int get currentPrice; // get을 쓰면 이 필드에 있다고 가정을 할 수 있음 / late는 임시방편
  int get yesterdayClosePrice;

  double get todayPercentage => ((currentPrice - yesterdayClosePrice)/ yesterdayClosePrice*100).toPrecision(2);

  String get todayPercentageString => "$symbol$todayPercentage%";

  bool get isPlus => currentPrice > yesterdayClosePrice;
  bool get isSame => currentPrice == yesterdayClosePrice;
  bool get isMinus => currentPrice < yesterdayClosePrice;


  String get symbol => isSame ? "": isPlus? "+" : "-";

  Color? getPriceColor(BuildContext context) =>isSame ? context.appColors.lessImportant : isPlus? context.appColors.plus : context.appColors.minus;
}