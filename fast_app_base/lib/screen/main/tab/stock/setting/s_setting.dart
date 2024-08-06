import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/datetime_extension.dart';
import 'package:fast_app_base/common/data/preference/app_preferences.dart';
import 'package:fast_app_base/common/widget/w_big_button.dart';
import 'package:fast_app_base/screen/main/tab/stock/setting/w_animated_app_bar.dart';
import 'package:fast_app_base/screen/main/tab/stock/setting/w_switch_menu.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../common/data/preference/prefs.dart';
import '../../../../opensource/s_opensource.dart';
import 'd_number.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> with SingleTickerProviderStateMixin { // controller가 한개일때는 SingleTickerProviderStateMixin
  final scrollController = ScrollController();
  late final AnimationController animationController = AnimationController(vsync: this, duration: 2000.ms);


  bool isPushOn = false;

  // @override                            // 고정된 화면에서만 prefs가 변하고 불러옴. 다른화면에서 바뀌면 반영을 못함
  // void initState() {
  //   isPushOn = Prefs.isPushOn.get();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            controller: scrollController,
            padding: const EdgeInsets.only(top: 100),
            children: [
              // switch
              Obx(
                // Rx value를 사용하려면 Obx 사용해야함 ()=>
                () => SwitchMenu(
                  '푸시 설정',
                  Prefs.isPushOnRx.get(),
                  onTap: (isOn) {
                    // Rx 변수를 사용하면 복잡한 코드에서 값이 꼬일 일이 없음
                    Prefs.isPushOnRx.set(isOn); // 값을 저장해서 나갔다 들어와도 그대로 유지 됨
                  },
                ),
              ),
              Obx(() => Slider(
                    value: Prefs.sliderPosition.get(),
                    onChanged: (value) {
                      animationController.animateTo(value, duration: 0.ms);
                      Prefs.sliderPosition(
                          value); // == Prefs.sliderPosition.set(value);
                    },
                  )),
              // slider

              Obx(
                () => BigButton(
                    '날짜 ${Prefs.birthday.get() == null ? "" : Prefs.birthday.get()?.formattedDate}',
                    onTap: () async {
                  // showDatePicker는 Future 함수이기에 async await 필요
                  final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now().subtract(90.days),
                    lastDate: DateTime.now().add(90.days),
                  );
                  if (date != null) {
                    Prefs.birthday(date);
                  }
                }),
              ),
              // date time

              Obx(
                () => BigButton('저장된 숫자 ${Prefs.number.get()}', onTap: () async {
                    // showDatePicker는 Future 함수이기에 async await 필요
                    final number = await NumberDialog().show();
                    if (number!= null){
                    Prefs.number.set(number);
                  }
                }),
              ),
              BigButton(
                '오픈소스 화면',
                onTap : () async{
                  Nav.push(const OpensourceScreen());
                }
              ),
              BigButton(
                  '애니메이션 forward',
                  onTap : () async{
                    animationController.forward();
                  }
              ),
              BigButton(
                  '애니메이션 reverse',
                  onTap : () async{
                    animationController.reverse();
                  }
              ),
              BigButton(
                  '애니메이션 repeat',
                  onTap : () async{
                    animationController.repeat();
                  }
              ),
              BigButton(
                  '애니메이션 reset',
                  onTap : () async{
                    animationController.repeat();
                  }
              ),
              BigButton(
                  '오픈소스 화면',
                  onTap : () async{
                    Nav.push(const OpensourceScreen());
                  }
              ),
              BigButton(
                  '오픈소스 화면',
                  onTap : () async{
                    Nav.push(const OpensourceScreen());
                  }
              ),
              BigButton(
                  '오픈소스 화면',
                  onTap : () async{
                    Nav.push(const OpensourceScreen());
                  }
              ),
              BigButton(
                  '오픈소스 화면',
                  onTap : () async{
                    Nav.push(const OpensourceScreen());
                  }
              ),BigButton(
                  '오픈소스 화면',
                  onTap : () async{
                    Nav.push(const OpensourceScreen());
                  }
              ),
              BigButton(
                  '오픈소스 화면',
                  onTap : () async{
                    Nav.push(const OpensourceScreen());
                  }
              ),BigButton(
                  '오픈소스 화면',
                  onTap : () async{
                    Nav.push(const OpensourceScreen());
                  }
              ),BigButton(
                  '오픈소스 화면',
                  onTap : () async{
                    Nav.push(const OpensourceScreen());
                  }
              ),
            ],
          ),
          AnimatedAppBar('설정', controller: scrollController, animationController: animationController,),
        ],
      ),
    );
  }
}
