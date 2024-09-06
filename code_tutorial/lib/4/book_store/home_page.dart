import 'package:code_tutoorial/4/book_store/book.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'book_service.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TextEditingController searchController = TextEditingController();

  void search(BookService bookService) {
    String keyword = searchController.text;
    if (keyword.isNotEmpty) {
      bookService.getBookList(keyword);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BookService>(builder: (context, bookService, child) {
      print(bookService.bookList);
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: false,
          title: const Text(
            "Book Store",
            style: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          actions: [
            Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.only(right: 12),
              child: Text(
                "Total ${bookService.bookList.length} books",
                style: const TextStyle(color: Colors.black, fontSize: 16),
              ),
            )
          ],
          bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 72),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                    hintText: "Please search for the book you want.",
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        search(bookService);
                      },
                    )),
                    // onChanged: (value) {
                    //   search(bookService);
                    // },
                onSubmitted: (v) {
                  search(bookService);
                },
              ),
            ),
          ),
        ),
        body: bookService.bookList.isEmpty
            ? const Center(
                child: Text(
                "enter a search item to search",
                style: TextStyle(color: Colors.grey, fontSize: 21),
              ))
            : ListView.builder(
                itemCount: bookService.bookList.length,
                itemBuilder: (context, index) {
                  Book book = bookService.bookList[index];
                  return ListTile(
                    leading: Image.network(
                      book.thumbnail,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                    title: Text(book.title),
                    subtitle: Text(book.subtitle),
                    onTap: () {
                      Uri url = Uri.parse(book.previewLink);
                      launchUrl(url);
                    },
                  );
                },
              ),
      );
    });
  }
}
