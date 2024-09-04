import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  const Feed({
    super.key,
  });

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          "https://cdn2.thecatapi.com/images/kat_7kqBi.png",
          height: 400,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        //
        Row(
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              icon: Icon(
                CupertinoIcons.heart,
                color: isFavorite ? Colors.pink : Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.chat_bubble,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.bookmark,
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "2 Likes",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
              "My cat is docile even when bathed. I put a duck on his head in the wick and he's staring at me. Isn't it so cute ??"),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "FEBUARY 6",
          ),
        ),
      ],
    );
  }
}

//*---------- Stateless Version

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class Feed extends StatelessWidget {
//   const Feed({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Image.network(
//           "https://cdn2.thecatapi.com/images/kat_7kqBi.png",
//           height: 400,
//           width: double.infinity,
//           fit: BoxFit.cover,
//         ),
//         Row(
//           children: [
//             IconButton(
//               onPressed: () {},
//               icon: const Icon(
//                 CupertinoIcons.heart,
//               ),
//             ),
//             IconButton(
//               onPressed: () {},
//               icon: const Icon(
//                 CupertinoIcons.chat_bubble,
//               ),
//             ),
//             const Spacer(),
//             IconButton(
//               onPressed: () {},
//               icon: const Icon(
//                 CupertinoIcons.bookmark,
//               ),
//             ),
//           ],
//         ),
//         const Padding(
//           padding: EdgeInsets.all(8.0),
//           child: Text(
//             "2 Likes",
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         const Padding(
//           padding: EdgeInsets.all(8.0),
//           child: Text(
//               "My cat is docile even when bathed. I put a duck on his head in the wick and he's staring at me. Isn't it so cute ??"),
//         ),
//         const Padding(
//           padding: EdgeInsets.all(8.0),
//           child: Text(
//             "FEBUARY 6",
//           ),
//         ),
//       ],
//     );
//   }
// }
