import 'package:coachinho/core/utils/num_parser.dart';
import 'package:coachinho/core/utils/string_parser.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  const User({
    required this.name,
    required this.avatar,
    required this.position,
    required this.point,
    required this.level,
    required this.speed,
    required this.agility,
    required this.dribbling,
    required this.handling,
    required this.stamina,
    required this.coordination,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @JsonKey(fromJson: StringParser.parse)
  final String name;

  @JsonKey(fromJson: StringParser.parse)
  final String avatar;

  @JsonKey(fromJson: StringParser.parse)
  final String position;

  @JsonKey(fromJson: NumParser.intParse)
  final int point;

  @JsonKey(fromJson: NumParser.intParse)
  final int level;

  @JsonKey(fromJson: NumParser.doubleParse)
  final double speed;

  @JsonKey(fromJson: NumParser.doubleParse)
  final double agility;

  @JsonKey(fromJson: NumParser.doubleParse)
  final double dribbling;

  @JsonKey(fromJson: NumParser.doubleParse)
  final double handling;

  @JsonKey(fromJson: NumParser.doubleParse)
  final double stamina;

  @JsonKey(fromJson: NumParser.doubleParse)
  final double coordination;

  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith(
      {String? name,
      String? avatar,
      String? position,
      int? point,
      int? level,
      double? speed,
      double? agility,
      double? dribbling,
      double? handling,
      double? stamina,
      double? coordination}) {
    return User(
        name: name ?? this.name,
        avatar: avatar ?? this.avatar,
        position: position ?? this.position,
        point: point ?? this.point,
        level: level ?? this.level,
        speed: speed ?? this.speed,
        agility: agility ?? this.agility,
        dribbling: dribbling ?? this.dribbling,
        handling: handling ?? this.handling,
        stamina: stamina ?? this.stamina,
        coordination: coordination ?? this.coordination);
  }

  @override
  List<Object?> get props => [
        name,
        avatar,
        position,
        point,
        level,
        speed,
        agility,
        dribbling,
        handling,
        stamina,
        coordination
      ];

  int get overall {
    return ((speed + agility + dribbling + handling + stamina + coordination) /
            6.0)
        .round();
  }
}
