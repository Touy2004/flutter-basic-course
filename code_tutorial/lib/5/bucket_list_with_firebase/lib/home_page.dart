import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:code_tutoorial/5/bucket_list_with_firebase/lib/bucket_service.dart';
import 'package:code_tutoorial/5/bucket_list_with_firebase/lib/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController jobController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<BucketService>(builder: (context, bucketService, child) {
      final authService = context.read<AuthService>();
      final user = authService.currentUser()!;
      return Scaffold(
          appBar: AppBar(
            title: const Text("Bucket List"),
            actions: [
              TextButton(
                onPressed: () {
                  context.read<AuthService>().logout();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
                child: const Text(
                  "Logout",
                ),
              )
            ],
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: jobController,
                        decoration: const InputDecoration(
                          hintText: "Please Enter what you want to do",
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (jobController.text.isNotEmpty) {
                          bucketService.create(user.uid, jobController.text);
                          debugPrint("Create");
                        }
                      },
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              Expanded(
                  child: FutureBuilder<QuerySnapshot>(
                      future: bucketService.read(user.uid),
                      builder: (context, snapshot) {
                        final document = snapshot.data?.docs ?? [];
                        if (document.isEmpty) {
                          return const Center(
                              child:
                                  Text("Please write the bucket list"));
                        }
                        return ListView.builder(
                          itemCount: document.length,
                          itemBuilder: (context, index) {
                            final doc = document[index];
                            String job = doc['jop'];
                            bool isDone = doc['isDone'];
                            return ListTile(
                              title: Text(
                                job,
                                style: TextStyle(
                                    fontSize: 24,
                                    color: isDone ? Colors.grey : Colors.black,
                                    decoration: isDone
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none),
                              ),
                              trailing: IconButton(
                                icon: const Icon(CupertinoIcons.delete),
                                onPressed: () {
                                  bucketService.delete(doc.id);
                                },
                              ),
                              onTap: () {
                                bucketService.update(doc.id, !isDone);
                              },
                            );
                          },
                        );
                      }))
            ],
          ));
    });
  }
}
