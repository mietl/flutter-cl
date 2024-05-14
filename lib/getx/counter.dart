import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(GetMaterialApp(home:Home()));

class Controller extends GetxController{
  var count = 0.obs;
  increment() => count++;
}


class Home extends StatelessWidget{
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final Controller c = Get.put(Controller());
    return Scaffold(
      appBar: AppBar(title: const Text('Count App')),
      body: Column(
        children: [
          Obx(()=>Text('Clicks:${c.count}')),
          ElevatedButton(
              onPressed: (){
                Get.to(const OtherPage());
              },
              child: const Text('Go to')
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: c.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class OtherPage extends StatelessWidget{
  const OtherPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Controller c =  Get.find();
    return Scaffold(
      body: Center(
        child: Text('状态${c.count}'),
      ),
    );
  }
  
}