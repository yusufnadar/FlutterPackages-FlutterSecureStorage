import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FlutterSecureStoragePage extends StatefulWidget {
  const FlutterSecureStoragePage({Key? key}) : super(key: key);

  @override
  _FlutterSecureStoragePageState createState() =>
      _FlutterSecureStoragePageState();
}

class _FlutterSecureStoragePageState extends State<FlutterSecureStoragePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Secure Storage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  UserSecureStorage.setText('Flutter Paketleri');
                },
                child: const Text('Set Text')),
            ElevatedButton(
                onPressed: () async {
                  print(await UserSecureStorage.getText());
                },
                child: const Text('Get Text')),
            const SizedBox(height: 150,),
            ElevatedButton(
                onPressed: () {
                  UserSecureStorage.setList(['Flutter1', 'Flutter2']);
                },
                child: const Text('Set List')),
            ElevatedButton(
                onPressed: () async {
                  print(await UserSecureStorage.getList());
                },
                child: const Text('Get List')),
          ],
        ),
      ),
    );
  }
}

class UserSecureStorage {
  static const storage = FlutterSecureStorage();

  static const textKey = 'textKey';
  static const listKeys = 'listKeys';

  static setText(String? text) async {
    await storage.write(key: textKey, value: text);
  }

  static getText() async {
    return await storage.read(key: textKey);
  }

  static getList() async {
    var list = await storage.read(key: listKeys);
    return json.decode(list!);
  }

  static setList(List liste)async{
    var myList = json.encode(liste);
    await storage.write(key: listKeys, value: myList);
  }
}
