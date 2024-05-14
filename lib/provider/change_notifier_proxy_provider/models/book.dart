class BookModel{
  static final _books = [
    Book(1,'窄门'),
    Book(2,'心灵捕手'),
  ];
  //获取书籍长度
  int get length => _books.length;
  //根据ID获取书籍
  Book getById(int id) => _books[id - 1];
  // 根据索引获取数据
  Book getByPosition(int position) => _books[position];
}

class Book{
  final int bookId;
  final String bookName;
  Book(this.bookId,this.bookName);
}

