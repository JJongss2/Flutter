import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:untitled1/main6.dart';
import 'package:untitled1/screen/new_page.dart';

void main() {
  runApp(
    MaterialApp.router(
      routerConfig: GoRouter(
          initialLocation: '/',
          routes: [
            GoRoute(
                path: '/', name: 'home', builder: (context, _) => HomeWidget()),
            GoRoute(
                path: '/new', name: 'new', builder: (context, _) => NewPage(),
            routes: [

             ],
            ),
            GoRoute(path: '/new1', name: 'new1', builder: (context, _) => NewPage2()),
          ]
      ),
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
            // Navigator.push(context, MaterialPageRoute(
            //   builder: (context) => NewPage(),
            //   )
            // );
            context.pushNamed('new');

          },
        ),
      ),
    );
  }
}
