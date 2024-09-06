import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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

/// Home Page
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<Bucket> bucketList = []; // Full Buck

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bucket list"),
      ),
      body: bucketList.isEmpty
          ? const Center(child: Text("Please write a bucket list."))
          : ListView.builder(
              itemCount: bucketList.length, // Show as many bucketList items
              itemBuilder: (context, index) {
                Bucket bucket = bucketList[
                    index]; // Get the bucket corresponding to the index
                return ListTile(
                  // Bucket list to-do
                  title: Text(
                    bucket.job.toString(),
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
                      showDeleteDialog(context, index);
                      print('$bucket: Delete');
                    },
                  ),
                  onTap: () {
                    setState(() {
                      bucket.isDone = !bucket.isDone;
                    });

                    print('$bucket:clicked');
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          // Move to bucket

          String? job = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CreatePage()),
          );
          if (job != null) {
            setState(() {
              Bucket newBucket = Bucket(job, false);
              bucketList.add(newBucket);
            });
          }
        },
      ),
    );
  }

  void showDeleteDialog(BuildContext context, int index) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Are you sure want to delete?"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel")),
              TextButton(
                  onPressed: () {
                    setState(() {
                      bucketList.removeAt(index);
                    });
                    Navigator.pop(context);
                  },
                  child: const Text("Delete"))
            ],
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
                    Navigator.pop(context, job); // Close the screen.
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



// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//     );
//   }
// }


// /// Home Page
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Bucket list"),
//       ),
//       body: const Center(child: Text("Please write a bucket list.")),
//       floatingActionButton: FloatingActionButton(
//         child: const Icon(Icons.add),
//         onPressed: () {
//           // Move to bucket creation page when + button is clicked
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (_) => const CreatePage()),
//           );
//         },
//       ),
//     );
//   }
// }

// /// Bucket creation page
// class CreatePage extends StatefulWidget {
//   const CreatePage({super.key});
//   @override
//   State<CreatePage> createState() => _CreatePageState();
// }

// class _CreatePageState extends State<CreatePage> {
//   // Used to get the value of TextField.
//   TextEditingController textController = TextEditingController();
// // warning message

//   String? error;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Create a bucket list"), // Backbutton
//         leading: IconButton(
//           icon: const Icon(CupertinoIcons.chevron_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             // Text input window

//             TextField(
//               controller: textController,
//               autofocus: true,
//               decoration: InputDecoration(
//                 hintText: "Enter what you want to do",
//                 errorText: error,
//               ),
//             ),
//             const SizedBox(height: 32), // Add button
//             SizedBox(
//               width: double.infinity,
//               height: 48,
//               child: ElevatedButton(
//                 child: const Text(
//                   "Add",
//                   style: TextStyle(
//                     fontSize: 18,
//                   ),
//                 ),
//                 onPressed: () {
//                   // When the Add button is clicked
             
                // },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
