import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Study to Container')),
        ),
        body: customContainer(),
      )
  )
  );
}

class customContainer extends StatelessWidget {
  const customContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 300,
        padding: EdgeInsets.fromLTRB(10, 12, 10, 12),
        decoration: BoxDecoration(
          color: Color(0xFFA1C57F),
          border: Border.all(color: Colors.red, width: 5, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(150),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.3), offset: Offset(6, 6), blurRadius: 10, spreadRadius: 10),
            BoxShadow(color: Colors.blue.withOpacity(0.3), offset: Offset(-6, -6), blurRadius: 10, spreadRadius: 10)
          ],

        ),
        child: Center(child: Container(
            color: Colors.yellow,
            child: Text('Hello Container!!')
        )
        ),
      ),
    );
  }
}

