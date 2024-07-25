import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/s_search_stock.dart';
import 'package:fast_app_base/screen/main/tab/stock/tab/f_my_stock.dart';
import 'package:fast_app_base/screen/main/tab/stock/tab/f_today_discovery.dart';
import 'package:flutter/material.dart';

import '../../../../common/constants.dart';
import '../../../../common/widget/w_image_button.dart';

class StockFragment extends StatefulWidget {
  const StockFragment({super.key});

  @override
  State<StockFragment> createState() => _StockFragmentState();
}

class _StockFragmentState extends State<StockFragment>
    with SingleTickerProviderStateMixin {
  late final tabController = TabController(length: 2, vsync: this);
  int currentIndex = 0;
  // late는 TabController가 필요할 때 생성이 되기때문에 오류가 발생 안함
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.veryDarkGrey,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true, // 앱바 고정
            backgroundColor: context.appColors.roundedLayoutBackground,
            // 앱바 배경색 고정
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: context.appColors.roundedLayoutBackground,
              ),
            ),
            actions: [
              ImageButton(
                imagePath: '$basePath/icon/stock_search.png',
                onTap: () {
                  Nav.push(SearchStockScreen());
                },
              ),
              ImageButton(
                imagePath: '$basePath/icon/stock_calendar.png',
                onTap: () {
                  context.showSnackbar('캘린더');
                },
              ),
              ImageButton(
                imagePath: '$basePath/icon/stock_settings.png',
                onTap: () {
                  context.showSnackbar('설정');
                },
              ),
            ], // 위젯 넣는 공간
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Column(
                children: [
                  title,
                  tabBar,
                  if(currentIndex == 0)
                    MyStockFragment()
                  else
                    TodayDiscoveryFragment(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget get title => Container(
    color: context.appColors.roundedLayoutBackground,
    child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            '토스증권'.text.size(24).bold.make(),
            width20,
            'S&P 500'
                .text
                .size(13)
                .bold
                .color(context.appColors.lessImportant)
                .make(),
            width10,
            3919.29
                .toComma()
                .text
                .size(13)
                .bold
                .color(context.appColors.plus)
                .make(),
          ],
        ).pOnly(left: 20),
  );

  Widget get tabBar => Container(
    color: context.appColors.roundedLayoutBackground,
    child: Column(
          children: [
            TabBar(
              onTap: (index){
                setState(() {

                });
                currentIndex = index;
              },
              labelStyle: const TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.bold),
              labelPadding: const EdgeInsets.symmetric(vertical: 20),
              indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
              indicatorColor: Colors.white,
              controller: tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                '내 주식'.text.make(),
                '오늘의 발견'.text.make()
              ],
            ),
            Line(),
          ],
        ),
  );

  Widget get myAccount => Placeholder();

  Widget get myStocks => Placeholder();
}
