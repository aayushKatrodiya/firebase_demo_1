import 'package:firebase_demo_1/firebase_api_services.dart';
import 'package:flutter/material.dart';

class SimpleCrudDemo extends StatefulWidget {
  const SimpleCrudDemo({super.key});

  @override
  State<SimpleCrudDemo> createState() => _SimpleCrudDemoState();
}

class _SimpleCrudDemoState extends State<SimpleCrudDemo> {
  TextEditingController textEditingController = TextEditingController();
  String? enterdedName;
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FireBase_demo"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: textEditingController,
            ),
            ElevatedButton(
              onPressed: () {
                FireBaseApi.addUser(userName: textEditingController.text);
                setState(() {});
              },
              child: const Text("Submite"),
            ),
            Text(enterdedName.toString()),
          ],
        ),
      ),
    );
  }
}
