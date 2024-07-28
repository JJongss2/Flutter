import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'w_opensource_item.dart';

class Package {
  final String name;
  final String version;
  final String license;

  Package({required this.name, required this.version, required this.license});

  factory Package.fromJson(Map<String, dynamic> json) {
    return Package(
      name: json['name'],
      version: json['version'],
      license: json['license'],
    );
  }
}

class LocalJson {
  static Future<List<Package>> getObjectList(String path) async {
    final jsonString = await rootBundle.loadString(path);
    final List<dynamic> jsonResponse = json.decode(jsonString);
    return jsonResponse.map((json) => Package.fromJson(json)).toList();
  }
}

class OpensourceScreen extends StatefulWidget {
  const OpensourceScreen({super.key});

  @override
  State<OpensourceScreen> createState() => _OpensourceScreenState();
}

class _OpensourceScreenState extends State<OpensourceScreen> {
  List<Package> packageList = [];

  @override
  void initState() {
    initData();
    super.initState();
  }

  void initData() async {
    try {
      final list = await LocalJson.getObjectList("assets/json/licenses.json");
      setState(() {
        packageList = list;
      });
    } catch (e) {
      print("Error loading JSON: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('오픈소스 라이센스'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => OpensourceItem(packageList[index]),
        itemCount: packageList.length,
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      ),
    );
  }
}

class OpensourceItem extends StatelessWidget {
  final Package package;

  const OpensourceItem(this.package, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(package.name),
      subtitle: Text('${package.version}\n${package.license}'),
    );
  }
}
