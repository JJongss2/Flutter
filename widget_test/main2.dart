import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Widget을 상하로 배치하기"),
        ),
        body: Body(),
      ),
    ),
  );
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column( // 상하
      mainAxisAlignment: MainAxisAlignment.center,  // y축
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row( // 좌우
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
            // 수직으로 위젯들을 배치하는데 사용
            // Column은 맨위에 달라붙는 형식, Center로 감싸도 가운데 위치X
            children: [
              Container(
                color: Colors.red,
                width: 100,
                height: 80,
                child: Text(
                  'Container1',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              Container(
                color: Colors.green,
                width: 100,
                height: 80,
                child: Text('Container2'),
              ),
              Container(
                color: Colors.blue,
                width: 100,
                height: 80,
                child: Text('Container3'),
              ),
            ],
          ),
        Container(
          width: 300,
          height: 120,
          color: Colors.grey,
          child: Text('Container4'),
        )
      ],
    );
  }
}
