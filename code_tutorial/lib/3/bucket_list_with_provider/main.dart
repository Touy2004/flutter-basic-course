import 'package:code_tutoorial/3/bucket_list_with_provider/bucket_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => BucketService())],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class Bucket {
  String job; // to do
  bool isDone; // completed or not
  Bucket(this.job, this.isDone); // constructor
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<BucketService>(builder: (context, bucketService, child) {
      List<Bucket> bucketList = bucketService.bucketList;

      return Scaffold(
        appBar: AppBar(
          title: const Text('Screen'),
        ),
        body: bucketList.isEmpty
            ? const Center(child: Text("Please write a bucket list."))
            : ListView.builder(
                itemCount: bucketList.length, // Show as many bucketList items
                itemBuilder: (context, index) {
                  var bucket = bucketList[
                      index]; // Get the bucket corresponding to the index
                  return ListTile(
// Bucket list to-do
                    title: Text(
                      bucket.job,
                      style: TextStyle(
                        fontSize: 24,
                        color: bucket.isDone ? Colors.grey : Colors.black,
                        decoration: bucket.isDone
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ), // Delete icon button
                    trailing: IconButton(
                      icon: const Icon(CupertinoIcons.delete),
                      onPressed: () {
                        bucketService.deleteBucket(index);
                      },
                    ),
                    onTap: () {
                      bucket.isDone = !bucket.isDone;
                      bucketService.updateBucket(bucket, index);
                    },
                  );
                },
              ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            // Move to bucket
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CreatePage()),
            );
          },
        ),
      );
    });
  }
}

/// Bucket creation page
class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  TextEditingController textController = TextEditingController();
  String? error;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create a bucket list"), // Back
        leading: IconButton(
          icon: const Icon(CupertinoIcons.chevron_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Text input window
            TextField(
              controller: textController,
              autofocus: true,
              decoration: const InputDecoration(
                hintText: "Enter what you want to do",
              ),
            ),
            const SizedBox(height: 32), // Add

            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                child: const Text(
                  "Add",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
                  // When the Add

                  String job = textController.text;
                  if (job.isEmpty) {
                    setState(() {
                      error =
                          "Please enter some content."; // Error message if there is no content
                    });
                  } else {
                    setState(() {
                      error = null; // Hide error message if there is content
                    });
                    BucketService bucketService = context.read<BucketService>();
                    bucketService.createBucket(job);
                    Navigator.pop(context); // Close the screen.
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
