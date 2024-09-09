// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Banner _$BannerFromJson(Map<String, dynamic> json) => Banner(
      desc: json['desc'] as String,
      bid: json['id'] as num,
      imagePath: json['imagePath'] as String,
      isVisible: (json['isVisible'] as num).toInt(),
      order: json['order'] as num,
      title: json['title'] as String,
      type: (json['type'] as num).toInt(),
      url: json['url'] as String,
    );

Map<String, dynamic> _$BannerToJson(Banner instance) => <String, dynamic>{
      'desc': instance.desc,
      'id': instance.bid,
      'imagePath': instance.imagePath,
      'isVisible': instance.isVisible,
      'order': instance.order,
      'title': instance.title,
      'type': instance.type,
      'url': instance.url,
    };
