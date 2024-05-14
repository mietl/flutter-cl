import 'package:flutter/material.dart';
import 'package:flutter_cl/provider/change_notifier_proxy_provider/models/book.dart';
import 'package:flutter_cl/provider/change_notifier_proxy_provider/models/book_manager.dart';
import 'package:provider/provider.dart';

class BookPage extends StatelessWidget{
  const BookPage({super.key});

  @override
  Widget build(BuildContext context){
    var bookList = Provider.of<BookModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("书籍列表")),
      body: ListView.builder(
          itemBuilder: (_,index)=> BookItem(book: bookList.getById(index+1)),
          itemCount: bookList.length,
      ),
    );
  }
}

class BookItem extends StatelessWidget{
  final Book book;
  const BookItem({required this.book,super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text("${book.bookId}"),
      ),
      title: Text(book.bookName),
      trailing: BookButton(book),
    );
  }
}

class BookButton extends StatelessWidget {
 final Book book;

 const BookButton(this.book,{super.key});

  @override
 Widget build(BuildContext context) {
    final bookManagerModel = Provider.of<BookManagerModel>(context);

    bool isStar = bookManagerModel.books.contains(book);

    var action = isStar? bookManagerModel.removeBook: bookManagerModel.addBook;

    return GestureDetector(
      onTap: ()=> action(book),
      child: SizedBox(
        width: 100,
        height: 60,
        child: isStar? const Icon(Icons.star,color: Colors.red): const Icon(Icons.star_border),
      ),
    );
  }

}