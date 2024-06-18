import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Widget을 비율로 배치하기"),
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
    return Row(
      children: [
        Container(
          width: 50,
          height: 200,
          color: Colors.red,
        ),
        Expanded(
          child: Container(
              color: Colors.blue,
              width: 100,
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color: Colors.red,
                      height: 50,
                      width: 50,
                      margin: EdgeInsets.symmetric(vertical: 10),
                    ),
                    Container(
                      color: Colors.red,
                      height: 50,
                      width: 50,
                      margin: EdgeInsets.symmetric(vertical: 10),
                    ),
                    Container(
                      color: Colors.red,
                      height: 50,
                      width: 50,
                      margin: EdgeInsets.symmetric(vertical: 10),
                    ),
                    Container(
                      color: Colors.red,
                      height: 50,
                      width: 50,
                      margin: EdgeInsets.symmetric(vertical: 10),
                    ),
                    Container(
                      color: Colors.red,
                      height: 50,
                      width: 50,
                      margin: EdgeInsets.symmetric(vertical: 10),
                    ),
                    Container(
                      color: Colors.red,
                      height: 50,
                      width: 50,
                      margin: EdgeInsets.symmetric(vertical: 10),
                    ),
                    Container(
                      color: Colors.red,
                      height: 50,
                      width: 50,
                      margin: EdgeInsets.symmetric(vertical: 10),
                    ),
                    Container(
                      color: Colors.red,
                      height: 50,
                      width: 50,
                      margin: EdgeInsets.symmetric(vertical: 10),
                    ),
                    Container(
                      color: Colors.red,
                      height: 50,
                      width: 50,
                      margin: EdgeInsets.symmetric(vertical: 10),
                    ),
                    Container(
                      color: Colors.red,
                      height: 50,
                      width: 50,
                      margin: EdgeInsets.symmetric(vertical: 10),
                    ),
                    Container(
                      color: Colors.red,
                      height: 50,
                      width: 50,
                      margin: EdgeInsets.symmetric(vertical: 10),
                    ),
                    Container(
                      color: Colors.red,
                      height: 50,
                      width: 50,
                      margin: EdgeInsets.symmetric(vertical: 10),
                    ),
                    Container(
                      color: Colors.red,
                      height: 50,
                      width: 50,
                      margin: EdgeInsets.symmetric(vertical: 10),
                    ),
                    Container(
                      color: Colors.red,
                      height: 50,
                      width: 50,
                      margin: EdgeInsets.symmetric(vertical: 10),
                    ),
                    Container(
                      color: Colors.red,
                      height: 50,
                      width: 50,
                      margin: EdgeInsets.symmetric(vertical: 10),
                    ),
                  ],
                ),
              )),
        ),

        Flexible(
            child: Container(
          color: Colors.red,
          width: 100,
        )),

        // Flexible(
        //   flex: 1,
        //   child: Container(
        //     color: Colors.red,
        //
        //   ),
        // ),
        // Flexible(
        //   flex: 2,
        //   child: Container(
        //     color: Colors.blue,
        //
        //   ),
        // ),
        // Flexible(
        //   flex: 3,
        //   child: Container(
        //     color: Colors.green,
        //
        //   ),
        // ),
        // Flexible(
        //   flex:4,
        //   child: Container(
        //     color: Colors.yellow,
        //
        //   ),
        // ),
      ],
    );
  }
}
