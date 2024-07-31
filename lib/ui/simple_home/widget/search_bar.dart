import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0,right: 20.0,bottom: 7.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 7,horizontal: 14),
              decoration: BoxDecoration(
                color: const Color(0xFFC8E1D7).withOpacity(.6),
                borderRadius: BorderRadius.circular(7)
              ),
              child: const Row(
                children: [
                  Icon(Icons.search_outlined),
                  SizedBox(width: 14.0),
                  Text('搜索')
                ],
              ),
                  
            ),
          ),
          const SizedBox(width: 7.0),
          const Icon(Icons.sailing_outlined)
        ],
      ),
    );
  }
  
}