import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("Flutter의 Callback"),
      ),
      body: Body(),
    ),
  ));
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return TestWidget();
  }
}

class TestWidget extends StatefulWidget {
  const TestWidget({super.key});

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        'Count : $value',
        style: const TextStyle(fontSize: 30),
      ),
      TestButton(addCounter),
    ]);
  }

  void addCounter(int addValue){
    setState(() => value += addValue);
  }
}

class TestButton extends StatelessWidget {
  const TestButton(this.callback, {super.key});

  final Function(int) callback;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      width: double.infinity,
      child: InkWell(  // 입력을 받는 기본 감지기
        onTap: () => callback.call(1),
        onDoubleTap: ()=> callback.call(2),
        onLongPress: ()=> callback.call(10),
        child: Center(
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              decoration: BoxDecoration(border: Border.all()),
              child: const Text(
                "Up Counter",
                style: TextStyle(fontSize: 24),
              )),
        ),
      ),
    );
  }
}
