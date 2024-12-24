// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      name: StringParser.parse(json['name']),
      avatar: StringParser.parse(json['avatar']),
      position: StringParser.parse(json['position']),
      point: NumParser.intParse(json['point']),
      level: NumParser.intParse(json['level']),
      speed: NumParser.doubleParse(json['speed']),
      agility: NumParser.doubleParse(json['agility']),
      dribbling: NumParser.doubleParse(json['dribbling']),
      handling: NumParser.doubleParse(json['handling']),
      stamina: NumParser.doubleParse(json['stamina']),
      coordination: NumParser.doubleParse(json['coordination']),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'avatar': instance.avatar,
      'position': instance.position,
      'point': instance.point,
      'level': instance.level,
      'speed': instance.speed,
      'agility': instance.agility,
      'dribbling': instance.dribbling,
      'handling': instance.handling,
      'stamina': instance.stamina,
      'coordination': instance.coordination,
    };
