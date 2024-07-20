import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'package:shake_count_app/red_box.dart';
import 'package:velocity_x/velocity_x.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver{
  int _counter = 0;
  late ShakeDetector detector;

  @override
  void initState() {
    
    WidgetsBinding.instance.addObserver(this);
    detector = ShakeDetector.autoStart(onPhoneShake: (){
      setState(() { // _counter가 변하는 것을 반영
        _counter++;
      });
    },
      shakeThresholdGravity: 1.5,
    );
    super.initState();
  }


  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this); // 메모리가 세어나가는 것을 방지
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const RedBox(), // ctrl + alt + m -> 반복되는 코드를 찾아서 함수로 만들어줌
                Column(
                  children: [
                    const RedBox().box.padding(EdgeInsets.all(30)).color(Colors.blue).make(),
                    '흔들어서 카운트를 올려보세요.'.text.size(20).color(Colors.red).bold.isIntrinsic.makeCentered().
                    box.withRounded(value: 50).color(Colors.green).height(150).make().
                    pSymmetric(h: 20, v: 50),
                    const RedBox(),
                  ],
                ),
                const RedBox(),
              ],
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch(state){

      case AppLifecycleState.detached:
        detector.startListening();
      case AppLifecycleState.resumed:
        break;
        // TODO: Handle this case.
      case AppLifecycleState.inactive:
        break;
        // TODO: Handle this case.
      case AppLifecycleState.paused:
        detector.stopListening(); // 백그라운드에서는 카운트 증가 안됨
      case AppLifecycleState.hidden:
        break;
        // TODO: Handle this case.
    }
  }
}