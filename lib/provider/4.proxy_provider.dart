import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dependency with ChangeNotifier{
  int value = 2214;

  void changeValue(int v){
    value = v;
    notifyListeners();
  }
}


class Translations {
  const Translations(this._value);

  final int _value;

  String get title => 'You clicked $_value times';
}


void main()=> runApp(const MyApp());

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Dependency>(create: (_)=> Dependency()),
        ProxyProvider<Dependency,Translations>(
            update:(_,dep,data) => Translations(dep.value)
        )
      ],
      child: const MaterialApp(
        home: ProxyProviderPage(),
      ),
    );
  }
}

class ProxyProviderPage extends StatefulWidget{
  const ProxyProviderPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProxyProviderPageState();
  }
}


class _ProxyProviderPageState extends State<ProxyProviderPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('proxy_provider')),
        body: Column(
          children: [
            Consumer<Dependency>(
                builder: (BuildContext context,dep, Widget? child) {
                  return Text(dep.value.toString(),style: const TextStyle(fontSize: 17));
            }),
            Consumer<Dependency>(
              builder: (context,dep,child){
                return TextButton(
                    onPressed: (){
                      dep.changeValue(2);
                    },
                    child: const Text('改变值 Dependency')
                );
              },
            ),
            Consumer<Translations>(
              builder: (context,value,child){
                return  Text(value.title);
              },
            ),
          ],
        )
    );
  }
}
