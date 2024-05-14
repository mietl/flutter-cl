import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}


class UserModel{
  String name = "mietl";
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    // Provider 只能用来展示数据
    return Provider(
        create: (_)=> UserModel(),
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const ProviderPage()
        )
    );
  }
}


class ProviderPage extends StatefulWidget{
  const ProviderPage({super.key});

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
          Consumer<UserModel>(
            builder: (BuildContext context, UserModel value, Widget? child) {
              return Text(value.name,style: const TextStyle(fontSize: 17));
          }),
        ],
      )
    );
  }
}
