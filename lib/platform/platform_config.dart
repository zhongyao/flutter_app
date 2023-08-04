import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
// ignore: must_be_immutable
class PlatformConfig extends Equatable {
  PlatformConfig();

  @JsonKey(name: "route_name")
  String? route_name;

  @JsonKey(name: "app_version")
  String? app_version;

  @override
  List<Object?> get props => [route_name, app_version];

  factory PlatformConfig.fromJson(Map<String, dynamic> json) =>
      platformConfigFromJson(json);
}

PlatformConfig platformConfigFromJson(Map<String, dynamic> json) =>
    PlatformConfig()
      ..route_name = json["route_name"] as String
      ..app_version = json["app_version"] as String;
