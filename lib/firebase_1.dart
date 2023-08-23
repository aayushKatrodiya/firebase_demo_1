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
  late Future<List<Map>> futureUserData;
  String selectedKey = '';
  bool isUpgrade = false;

  @override
  void initState() {
    futureUserData = FireBaseApi.selectData();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Center(child: Text("FireBase_demo")),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              controller: textEditingController,
            ),
          ),
          ElevatedButton(
            onPressed: isUpgrade == true
                ? () async {
                    await FireBaseApi.updateData(
                      key: selectedKey,
                      userName: textEditingController.text,
                    );
                    futureUserData = FireBaseApi.selectData();
                    setState(() {});
                  }
                : () async {
                    await FireBaseApi.addUser(
                        userName: textEditingController.text);
                    futureUserData = FireBaseApi.selectData();
                    textEditingController.clear();
                    setState(() {});
                  },
            child: Text(isUpgrade == true ? "update" : "Submit"),
          ),
          const SizedBox(height: 20),
          FutureBuilder(
            future: futureUserData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) => Dismissible(
                      key: UniqueKey(),
                      onDismissed: (direction) async {
                        await FireBaseApi.removeData(
                            key: snapshot.data![index]['key']);
                        isUpgrade = false;
                        futureUserData = FireBaseApi.selectData();
                      },
                      child: ListTile(
                        onTap: () {
                          selectedKey = snapshot.data![index]['key'];
                          textEditingController.text =
                              snapshot.data![index]['userName'];
                          setState(() {
                            isUpgrade = true;
                          });
                        },
                        title: Text(snapshot.data![index]['userName']),
                        subtitle: Text(snapshot.data![index]['key']),
                      ),
                    ),
                    itemCount: snapshot.data!.length,
                  ),
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          )
        ],
      ),
    );
  }
}
