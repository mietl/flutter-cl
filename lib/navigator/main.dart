import 'package:flutter/material.dart';
import 'package:flutter_cl/navigator/pick_color.dart';
import 'package:flutter_cl/navigator/second.dart';

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  fade(context) {
    Navigator.of(context).push(
        PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
      return FadeTransition(opacity: animation, child: const SecondPage());
    }));
  }

  // 新页面从屏幕右边滑入，旧页面从左侧滑出
  transition(context) {
    Navigator.of(context).push(PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return const SecondPage();
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(1.0, 0.0);

        var end = Offset.zero;

        var tween = Tween(begin: begin, end: end)
            .chain(CurveTween(curve: Curves.bounceIn));

        return SlideTransition(position: animation.drive(tween), child: child);
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<Color> colorNotifier = ValueNotifier(Colors.transparent);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('PageRoute'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                  onPressed: () => fade(context), child: const Text('second')),
              ElevatedButton(
                  onPressed: () => transition(context),
                  child: const Text('transtion')),
              ValueListenableBuilder(
                  valueListenable: colorNotifier,
                  builder: (context, value, child) {
                    return Container(
                      color: colorNotifier.value,
                      width: 170,
                      height: 70,
                      alignment: Alignment.center,
                      child: Text('颜色:${colorNotifier.value}'),
                    );
                  }),
              ElevatedButton(
                  onPressed: () async {
                    Color result = await Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) =>
                                const PickColorPage(Color(0xFFF3f17c))));

                    colorNotifier.value = result;
                  },
                  child: const Text('pick color'))
            ],
          ),
        ));
  }
}
