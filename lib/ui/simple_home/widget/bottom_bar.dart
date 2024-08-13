import 'package:flutter/material.dart';

class BottomBarWidget extends StatefulWidget{
  const BottomBarWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _BottomBarWidgetState();
  }

}

class _BottomBarWidgetState extends State<BottomBarWidget>{
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
        onDestinationSelected: (value){
          setState(() {
            selectedIndex = value;
          });
        },
        selectedIndex: selectedIndex,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.cottage_outlined), label: '首页'),
          NavigationDestination(icon: Icon(Icons.tag), label: '标签'),
          NavigationDestination(icon: Icon(Icons.email_outlined), label: '信'),
          NavigationDestination(icon: Icon(Icons.music_note), label: '轻音乐'),
        ]
    );
  }
  
}