import 'package:flutter/material.dart';
import 'package:untitled1/screen/new_page.dart';

void main() {
  runApp(
    const MaterialApp(
      home: HomeWidget(),
    ),
  );
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter에서 화면 이동하기"),
      ),
      body: Center(
        child: TextButton(
          child: Text('Go to Page'),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute
              (builder: (context) => const NewPage()));
          },
        ),
      ),
    );
  }
}
