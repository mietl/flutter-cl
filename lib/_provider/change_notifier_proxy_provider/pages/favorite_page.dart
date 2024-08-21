import 'package:flutter/material.dart';
import 'package:flutter_cl/_provider/change_notifier_proxy_provider/models/book_manager.dart';
import 'package:flutter_cl/_provider/change_notifier_proxy_provider/pages/book_page.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget{
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    var bookManager = Provider.of<BookManagerModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('收藏列表')),
      body: ListView.builder(
        itemBuilder: (_,index)=>BookItem(book: bookManager.getByPosition(index)),
        itemCount:  bookManager.length,
      )
    );
  }
}