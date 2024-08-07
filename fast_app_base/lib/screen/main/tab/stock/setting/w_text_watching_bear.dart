import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class TextWatchingBearController{
  late void Function() runSuccessAnimation;
  late void Function() runFailAnimation;
}
class TextWatchingBear extends StatefulWidget {
  final bool check;
  final bool handsUp;
  final double look;
  final TextWatchingBearController controller;


  const TextWatchingBear({super.key, required this.check, required this.handsUp, required this.look, required this.controller,});

  @override
  State<TextWatchingBear> createState() => _TextWatchingBearState();
}

class _TextWatchingBearState extends State<TextWatchingBear> {
  late StateMachineController controller;
  late SMIBool smiCheck;
  late SMIBool smiHandsUp;
  late SMINumber smiLook;
  late SMITrigger smiSuccess;
  late SMITrigger smiFail;

  @override
  void initState() {
    widget.controller.runSuccessAnimation = (){
      smiSuccess.fire();
    };
    widget.controller.runFailAnimation = (){
      smiFail.fire();
    };

    super.initState();
  }
  @override
  void didUpdateWidget(covariant TextWatchingBear oldWidget) {
    if(oldWidget.check != widget.check){
      smiCheck.value = widget.check;
    }

    if(oldWidget.handsUp != widget.handsUp){
      smiHandsUp.value = widget.handsUp;
    }

    if(oldWidget.look != widget.look){
      smiLook.value = widget.look;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return RiveAnimation.asset("$baseRivePath/animated_login_character.riv",
        stateMachines: const ['Login Machine'],
        onInit: (Artboard art){
          controller = StateMachineController.fromArtboard(art, 'Login Machine')!;
          controller.isActive = true;
          art.addController(controller);
          smiCheck = controller.findInput<bool>('isChecking') as SMIBool;
          smiHandsUp = controller.findInput<bool>('isHandsUp') as SMIBool;
          smiLook = controller.findInput<double>('numLook') as SMINumber;
          smiSuccess = controller.findInput<bool>('trigSuccess') as SMITrigger;
          smiFail = controller.findInput<bool>('trigFail') as SMITrigger;


        }, // 컨트롤러와 아트보드를 연결해줌
      );
  }
}
