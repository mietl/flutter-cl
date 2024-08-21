import 'package:flutter/material.dart';
import 'package:flutter_cl/_provider/change_notifier_proxy_provider/models/book.dart';

class BookManagerModel with ChangeNotifier{
  final BookModel _bookModel;

  final List<int> _bookIds = [];

  // 依赖的bookModel;
  BookManagerModel(this._bookModel);

  // 获取所有的书
  List<Book> get books => _bookIds.map((id) => _bookModel.getById(id)).toList();

  int get length => _bookIds.length ?? 0;

  void addBook(Book book){
    _bookIds.add(book.bookId);
    notifyListeners();
  }

  void removeBook(Book book){
    _bookIds.remove(book.bookId);
    notifyListeners();
  }

  //根据索引获取数据
  Book getByPosition(int position) => books[position];

}