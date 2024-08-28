import 'package:flutter/material.dart';
import 'package:flutter_cl/_provider/change_notifier_proxy_provider/models/book.dart';
import 'package:provider/provider.dart';
import 'pages/book_page.dart';
import 'pages/favorite_page.dart';
import 'models/book_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => BookModel()),
        ChangeNotifierProxyProvider<BookModel, BookManagerModel>(
            create: (_) => BookManagerModel(BookModel()),
            update: (_, bookModel, bookManagerModel) =>
                BookManagerModel(bookModel))
      ],
      child: const MaterialApp(
        home: ChangeNotifierProxyProviderPage(),
      ),
    );
  }
}

class ChangeNotifierProxyProviderPage extends StatefulWidget {
  const ChangeNotifierProxyProviderPage({super.key});

  @override
  State<ChangeNotifierProxyProviderPage> createState() {
    return _ChangeNotifierProxyProviderPageState();
  }
}

class _ChangeNotifierProxyProviderPageState
    extends State<ChangeNotifierProxyProviderPage> {
  var _selectedIndex = 0;

  final pages = [const BookPage(), const FavoritePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChangeNotifierProxyProvider'),
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(Icons.book),
            icon: Icon(Icons.book),
            label: '书籍',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.favorite, color: Color(0xFFE59E99)),
            icon: Icon(Icons.favorite_border),
            label: '收藏',
          ),
        ],
      ),
    );
  }
}
