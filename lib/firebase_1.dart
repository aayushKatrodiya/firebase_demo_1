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
            TextFormField(),
            ElevatedButton(
              onPressed: () {
                enterdedName = textEditingController.text;
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
