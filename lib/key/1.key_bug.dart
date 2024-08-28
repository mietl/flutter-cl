import 'package:flutter/material.dart';

// 没有key，所以判定同一个Element会复用的（复用前两个色块），数字状态保留下来了，
// 只是widget会重建导致widget的color状态丢失所以颜色会刷新
// 复用时只判断了类型，没有 key 可判断，element 指向了错误的 state


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const KeyBugPage(),
    );
  }
}

class KeyBugPage extends StatefulWidget {
  const KeyBugPage({super.key});

  @override
  State<KeyBugPage> createState() => _KeyBugPageState();
}

class _KeyBugPageState extends State<KeyBugPage> {

  List<Widget> boxs = [
    const KeyBoxWidget(color: Colors.red),
    const KeyBoxWidget(color: Colors.green),
    const KeyBoxWidget(color: Colors.blue)
    // const KeyBoxWidget(color: Colors.red,key: ValueKey(1)),
    // const KeyBoxWidget(color: Colors.green,key: ValueKey(2)),
    // const KeyBoxWidget(color: Colors.blue,key: ValueKey(3))
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('key_bug'),
        ),
        body: Column(
          children: boxs,
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: (){
              boxs.removeAt(0);
              setState(() {});
            },
            child: const Icon(Icons.remove),
        ),
    );
  }
}

class KeyBoxWidget extends StatefulWidget {
  final Color color;

  const KeyBoxWidget({super.key, required this.color});

  @override
  State<StatefulWidget> createState() {
    return _KeyBoxWidgetState();
  }

}

class _KeyBoxWidgetState extends State<KeyBoxWidget> {
  int count = 0;

  _increment(){
    setState(() {
      ++count;
    });
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _increment,
      child: Container(
          color: widget.color,
          width: 100,
          height: 100,
          alignment: Alignment.center,
          child: Text(count.toString(),
            style: const TextStyle(fontSize: 21),
          )
      ),
    );
  }
}
