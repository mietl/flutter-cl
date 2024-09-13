class Hitokoto {
  Hitokoto({
    required this.id,
    required this.uuid,
    required this.hitokoto,
    required this.type,
    required this.from,
    required this.fromWho,
    required this.creator,
    required this.creatorUid,
    required this.reviewer,
    required this.commitFrom,
    required this.createdAt,
    required this.length,
  });

  final int id;
  final String uuid;
  final String hitokoto;
  final String type;
  final String from;
  final dynamic fromWho;
  final String creator;
  final int creatorUid;
  final int reviewer;
  final String commitFrom;
  final String createdAt;
  final int length;

  factory Hitokoto.fromJson(Map<String, dynamic> json) {
    return Hitokoto(
      id: json["id"] ?? 0,
      uuid: json["uuid"] ?? "",
      hitokoto: json["hitokoto"] ?? "",
      type: json["type"] ?? "",
      from: json["from"] ?? "",
      fromWho: json["from_who"],
      creator: json["creator"] ?? "",
      creatorUid: json["creator_uid"] ?? 0,
      reviewer: json["reviewer"] ?? 0,
      commitFrom: json["commit_from"] ?? "",
      createdAt: json["created_at"] ?? "",
      length: json["length"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "hitokoto": hitokoto,
        "type": type,
        "from": from,
        "from_who": fromWho,
        "creator": creator,
        "creator_uid": creatorUid,
        "reviewer": reviewer,
        "commit_from": commitFrom,
        "created_at": createdAt,
        "length": length,
      };

  @override
  String toString() {
    return "$id, $uuid, $hitokoto, $type, $from, $fromWho, $creator, $creatorUid, $reviewer, $commitFrom, $createdAt, $length, ";
  }
}

/*
{
	"id": 9166,
	"uuid": "596955d9-6366-44bc-a3bd-97819bd1feaf",
	"hitokoto": "暴雨中前进，伞是倒划天空的船。",
	"type": "l",
	"from": "弱智吧",
	"from_who": null,
	"creator": "IcyFeather",
	"creator_uid": 13880,
	"reviewer": 1044,
	"commit_from": "web",
	"created_at": "1672324303",
	"length": 15
}*/