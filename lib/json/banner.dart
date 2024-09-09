import 'package:json_annotation/json_annotation.dart';

part 'banner.g.dart'; // 1. 指定生成文件

@JsonSerializable() // 2. 添加注解，告诉编译器，序列化
class Banner {
  final String desc;
  @JsonKey(name: 'id') // 添加注解，告知此属性对应的json key
  final num bid;
  final String imagePath;
  final int isVisible;
  final num order;
  final String title;
  final int type;
  final String url;

  Banner(
      {required this.desc,
      required this.bid,
      required this.imagePath,
      required this.isVisible,
      required this.order,
      required this.title,
      required this.type,
      required this.url});

  // 3. 序列化 固定写法 _$类名FromJson
  factory Banner.fromJson(Map<String, dynamic> json) => _$BannerFromJson(json);

  // 4. 反序列
  Map<String, dynamic> toJson() => _$BannerToJson(this);
}

// { 
//   "desc": "我们支持订阅啦~",
//   "id": 30,
//   "imagePath": "https://www.wanandroid.com/blogimgs/42da12d8-de56-4439-b40c-eab66c227a4b.png",
//   "isVisible": 1,
//   "order": 2,
//   "title": "我们支持订阅啦~",
//   "type": 0,
//   "url": "https://www.wanandroid.com/blog/show/3352"
// }

