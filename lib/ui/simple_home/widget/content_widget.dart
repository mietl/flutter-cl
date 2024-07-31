import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContentWidget extends StatefulWidget{
  const ContentWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ContentWidgetState();
  }

}



class _ContentWidgetState extends State<ContentWidget> with SingleTickerProviderStateMixin{
  List<String> tabListData = ['纸灯','贴纸','日记','糖果','便签','薯条','饼干','加醋','羽毛球','伤口'];

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: tabListData.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          TabBar(
              isScrollable: true,
              controller: _tabController,
              tabs: tabListData.map((value)=>Tab(text: value)).toList(),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: tabListData.map((value){
                return _buildListItem(value);
              }).toList()
            ),
          )
        ],
      ),
    );
  }

  buildTagRadius(String text,Color color){
   return Container(
     padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
     decoration: BoxDecoration(
       color: color.withOpacity(0.15),
       borderRadius: BorderRadius.circular(12),
     ),
     child: Text(
       text
     ),
   );
  }

  Widget _buildListItem(title) {
    return ListView.separated(
        itemBuilder: (BuildContext context, int index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 7,horizontal: 14),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(title,
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Color(0xFF424242),
                       )
                    )
                  ]
                ),
                const Row(
                    children:  [
                      Icon(Icons.tag_rounded,size: 14),
                      SizedBox(width: 4.0),
                      Text('mietl',style: TextStyle(fontSize: 14))
                    ]
                ),
                const SizedBox(
                  height: 7,
                ),
                const Row(
                  children: [
                    Expanded(
                      child: Text('现实也许没有那么天真，但我想要做什么事，虽然不知道答案，但是只要有所行动，就一定会有所改变。',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 7,
                ),
                Row(
                  children: [
                    const Icon(Icons.date_range,size: 21),
                    Text(DateTime.now().year.toString()),
                    const Spacer(),
                    buildTagRadius('Flutter',const Color(0xFF1d6253)),
                    const SizedBox(width: 7.0),
                    buildTagRadius('App',const Color(0xFFff4e6a))
                  ],
                )
              ],
            ),
          );
        },
        separatorBuilder: (context,index){
          return const Divider(
              color: Color(0xFFCCCCCC),
              thickness: 0.7
          );
        }, itemCount: 24);
  }
}