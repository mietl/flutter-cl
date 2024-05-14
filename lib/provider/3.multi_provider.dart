import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserInfo with ChangeNotifier{
  String userName = 'mietl';

  void changeUserName(String name){
    userName = name;
    notifyListeners();
  }
}

class ColorScheme with ChangeNotifier{
  Color primaryColor = const Color(0xFFd276a3);

  setColorScheme(Color cl){
    primaryColor = cl;
    notifyListeners();
  }
}


void main()=> runApp(MyApp());

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>ColorScheme()),
        ChangeNotifierProvider(create: (_)=>UserInfo()),
      ],
      child: MaterialApp(
        home: ProviderPage(),
      ),
    );
  }
}

class ProviderPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ProviderPageState();
  }
}


class _ProviderPageState extends State<ProviderPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Provider')),
        body: Column(
          children: [
            Consumer<ColorScheme>(
              builder: (context,value,child){
                return Container(
                  width: 100,
                  height: 100,
                  color: value.primaryColor,
                  child: child,
                );
              },
              child: const Text('box'),
            ),
            Consumer<UserInfo>(
                builder: (BuildContext context, UserInfo value, Widget? child) {
                  return Text(value.userName,style: const TextStyle(fontSize: 17));
                }),
          ],
        )
    );
  }
}
